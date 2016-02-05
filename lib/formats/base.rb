require "music_sanitizer"
require "active_support/all"
require "nokogiri"

module Station
  module Format
    class Base
      def self.inherited(base)
        unless base.to_s.match(/Format/)
          Station.stations << base
        end
      end

      NO_MATCH = false

      attr_reader :data, :args

      def initialize(data)
        raise "id in parent isn't set" if config.id.blank?
        raise "url in parent isn't set" if config.url.blank?
        @data = data
      end

      def perform
        return NO_MATCH if content.blank?

        unless content.is_a?(Hash)
          fail InvalidDataFromSource, 
            "content must be of type hash, is #{content.class}"
        end

        song   = content.fetch(:song)
        artist = content.fetch(:artist)

        # Is fetched data empty?
        if song.blank? or artist.blank?
          return NO_MATCH
        end

        if config.exclude.is_a?(Array)
          return NO_MATCH if config.exclude.any? do |el|
            el.downcase.include?(song.downcase) or 
              el.downcase.include?(artist.downcase)
          end
        end

        artist   = artist.split(/\s+&\s+/).first
        c_song   = strip(song)
        c_artist = strip(artist)

        # Is striped data empty?
        if c_song.blank? or c_artist.blank?
          return NO_MATCH
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

      def get(hash, keys)
        split_keys = keys.split(".")
        split_keys.each_with_index do |key, index|
          unless hash = hash[key]
            raise KeyError, "key not found: #{split_keys[0..index].join(".")}"
          end
        end

        hash
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
        @_content ||= process(*(config.args || []))
      end

      def fail(klass, message)
        raise klass, "[#{config.id}] #{message}"
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

      def args(value = nil)
        value ? @args = value : @args
      end
    end
  end
end