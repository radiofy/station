require "rest-client"
require "timeout"
require "charlock_holmes/string"

class Get
  def initialize
    @urls = {}
  end

  def get(config)
    @urls[config.url] ||= RestClient::Request.execute({
      method: "get",
      url: config.url,
      headers: {
        user_agent: "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36"
      },
      cookies: config.cookies,
      timeout: 3, 
      open_timeout: 3
    })

    detection = CharlockHolmes::EncodingDetector.detect(@urls[config.url])
    if detection[:encoding]
      CharlockHolmes::Converter.convert @urls[config.url], detection[:encoding], 'UTF-8'
    else
      @urls[config.url]
    end
  rescue RestClient::Exception, SocketError
    return false
  end
end