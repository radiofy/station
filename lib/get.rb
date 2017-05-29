require "rest-client"
require "timeout"
require "charlock_holmes/string"

class Get
  def initialize
    @urls = {}
  end

  def get(config)
    url = config.source.fetch(:url)
    @urls[url] ||= RestClient::Request.execute({
      method: "get",
      url: url,
      headers: {
        user_agent: "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36"
      },
      cookies: config.source[:cookies],
      timeout: 3,
      open_timeout: 3
    })

    detection = CharlockHolmes::EncodingDetector.detect(@urls[url])
    if detection[:encoding]
      CharlockHolmes::Converter.convert @urls[url], detection[:encoding], 'UTF-8'
    else
      @urls[url]
    end
  rescue RestClient::Exception, SocketError
    return false
  rescue ArgumentError
    return false
  end
end