require "music_sanitizer"
require "rest-client"
require "active_support/all"

module Station
  @@subclasses = []

  def self.stations
    @@subclasses
  end

  class Base
    def self.inherited(base)
      if base.to_s.match(/Unit/)
        Station.stations << base
      end
    end

    attr_reader :data, :args

    def initialize
      raise "id in parent isn't set" if config.read_id.blank?
      raise "url in parent isn't set" if config.read_url.blank?
    end

    def perform
      fail NoData, "No data" if content.nil?

      unless content.is_a?(Hash)
        fail InvalidDataFromSource, 
          "content must be of type hash, is #{content.class}"
      end

      song   = content.fetch(:song)
      artist = content.fetch(:artist)

      # Is fetched data empty?
      if song.blank? or artist.blank?
        fail NoData,
          "song or artist is blank song=#{song}, artist=#{artist}"
      end

      artist   = artist.split(/\s+&\s+/).first
      c_song   = strip(song)
      c_artist = strip(artist)

      # Is striped data empty?
      if c_song.blank? or c_artist.blank?
        fail NoData, 
          "song or artist is blank after processing song=#{song}, artist=#{artist}"
      end

      return {
        original: {
          song: song,
          artist: artist
        },
        song: {
          title: c_song
        },
        artist: {
          name: c_artist
        },
        id: config.read_id
      }
    end

    def self.config(&block)
      @@config ||= Config.new
      @@config.instance_eval(&block)
    end

    def config
      @@config
    end

    protected

    #
    # @raw String Data from provider
    # @return Array<String, String>
    #
    def split(raw)
      a, b = raw.to_s.split(/\s+-\s+/, 2)
      # Did someone forgott a space before the dash?
      if [a, b].any?(&:blank?)
        res = raw.to_s.split(/\s*-\s*/, 2)
      else
        res = [a, b]
      end

      res.map(&:strip)
    end

    #
    # @data String
    # @return String
    #
    def strip(data)
      MusicSanitizer::Processor.new(data).process
    end

    def content
      @_content ||= process
    rescue
      raise ExternalError.new($!)
    end

    def fail(klass, message)
      raise klass, "[#{config.read_id}] #{message}"
    end

    private

    def data
      @_data ||= RestClient.get(config.read_url)
    rescue RestClient::Exception
      raise ExternalError.new($!)
    end
  end

  class Config
    def id(value)
      @id = value
    end

    def url(value)
      @url = value
    end

    def read_id
      @id
    end

    def read_url
      @url
    end
  end

  class InvalidDataFromSource < StandardError
  end

  class NoData < StandardError
  end

  class ExternalError < StandardError
  end
end