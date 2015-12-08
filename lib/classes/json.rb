require_relative "./base"

module Station::Base
  class JSON < Base
    def data
      super.present? ? ::JSON.parse(super) : {}
    end
  end
end