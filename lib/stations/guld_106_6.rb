module Station
  class Guld1066 < Format::Raw
    config do
      id "guld-106-6"
      url "http://2.st.nu/guld/active/justnu/"
    end

    def process
      raw = data.scan(/var\s*(.+?)\s*=\s*'(.+?)'/)
      { :artist => (raw.detect { |s| (s.first == "artist") }.try(:last)), :song => (raw.detect { |s| (s.first == "song") }.try(:last)) }

    end
  end
end
