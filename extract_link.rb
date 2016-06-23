class ExtractLink
  attr_reader :url
  def initialize(url)
    @url = PostRank::URI.normalize(url)
  end

  def process
    json["log"]["entries"].each_with_object([]) do |entry, result|
      if item = fetch_url(entry)
        result << [PostRank::URI.normalize(item[0]).to_s, item[1]]
      end
    end
  end

  private

  def sniff
    "./netsniff.js"
  end

  def fetch_url(entry)
    return false if entry.dig("response", "status") != 200
    
    url = entry.dig("request", "url")
    mime = entry.dig("response", "content", "mimeType")

    if mime.nil? or not mime.include?("text")
      return false # (warn "#{url} ignored with #{mime}")
    end

    [
      "text/css",
      "text/javascript"
    ].each do |type|
      if mime.include?(type)
        return false # (warn "#{url} ignored with #{type}")
      end
    end

    [
      "fbcdn",
      "fbstatic",
      "gstatic",
      "google",
      "facebook",
      "twitter.com"
    ].each do |type|
      if url.include?(type)
        return false # (warn "#{url} ignored with #{type}")
      end
    end

    return [url, mime]
  end

  def json
    JSON.parse(`phantomjs #{sniff} #{url} 2> /dev/null`)
  end
end