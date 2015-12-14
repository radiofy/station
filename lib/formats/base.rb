require "music_sanitizer"
require "rest-client"
require "active_support/all"
require "nokogiri"
require "pp"

module Station
  @@subclasses = []

  def self.stations
    @@subclasses
  end

  module Format
    class Base
      def self.inherited(base)
        unless base.to_s.match(/Format/)
          Station.stations << base
        end
      end

      attr_reader :data, :args

      def initialize
        raise "id in parent isn't set" if config.id.blank?
        raise "url in parent isn't set" if config.url.blank?
      end

      def perform
        fail NoData, "No data" if content.nil?

        unless content.is_a?(Hash)
          fail InvalidDataFromSource, 
            "content must be of type hash, is #{content.class}"
        end

        song   = content.fetch(:song)
        artist = content.fetch(:artist)

        if config.exclude.is_a?(Array)
          config.exclude.each do |el|
            if el.match(/#{song}/i) or el.match(/#{artist}/i)
              return NO_MATCH
            end
          end
        end

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
          id: config.id
        }
      end

      def self.config(&block)
        if block_given?
          @config = Config.new
          @config.instance_exec(&block)
        else
          @config
        end
      end

      def config
        self.class.config
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

      def strip(data)
        MusicSanitizer::Processor.new(data).process
      end

      def process
        data
      end

      def content
        @_content ||= process
      end

      def fail(klass, message)
        raise klass, "[#{config.id}] #{message}"
      end

      private

      def data
        @_data ||= RestClient.get(config.url)
      rescue RestClient::Exception
        raise ExternalError.new($!)
      end
    end

    class Config
      def id(value = nil)
        value ? @id = value : @id
      end

      def url(value = nil)
        value ? @url = value : @url
      end

      def exclude(value = nil)
        value ? @exclude = value : @exclude
      end

      def disabled(value = nil)
        value ? @disabled = true : @disabled
      end
    end

    NO_MATCH = true

    class InvalidDataFromSource < StandardError
    end

    class NoData < StandardError
    end

    class ExternalError < StandardError
    end
  end
end