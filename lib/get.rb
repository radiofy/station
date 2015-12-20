require "http"
require "timeout"
require "charlock_holmes/string"

class Get
  def initialize
    @urls = {}
  end

  def get(station)
    url = station.config.url
    Timeout::timeout(2) do
      @urls[url] ||= `curl --silent -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36' --compressed '#{url}' | iconv -s -t utf8`
      detection = CharlockHolmes::EncodingDetector.detect(@urls[url])
      if detection[:encoding]
        CharlockHolmes::Converter.convert @urls[url], detection[:encoding], 'UTF-8'
      else
        @urls[url]
      end
    end
  rescue Errno::ENOTCONN, Errno::ECONNRESET, Errno::ENOTCONN, IOError, SocketError, Timeout::Error
    return false
  end
end