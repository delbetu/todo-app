require 'core_helper'

describe GetItem do
  def call(id, data_provider)
    GetItem.call(
      id: id,
      data_provider: data_provider
    )
  end

  it 'returns an item'do
    some_item = Dto::Item.new(id: 1, title: 'title', completed: false)
    result = call(1, double(get: some_item))

    expect(result).to eq(some_item)
  end

  it 'returns null item when item is not found' do
    result = call(9999, double(get: nil))

    expect(result.id).to be_nil
    expect(result.title).to be_nil
    expect(result.completed).to be_nil
  end
end
