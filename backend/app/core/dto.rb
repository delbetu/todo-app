module Dto
  Item = Struct.new(:id, :title, :completed)
  class NullItem < Item
    def id; end
    def title; end
    def completed; end
    def nil?; true; end
  end
end

