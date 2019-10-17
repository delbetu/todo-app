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
    result = call(1, double(find_by: some_item))

    expect(result).to eq(some_item)
  end

  it 'returns null item when item is not found' do
      result = call(9999, double(find_by: nil))

      expect(result.id).to be_nil
      expect(result.title).to be_nil
      expect(result.completed).to be_nil
  end

  it 'raise argument error when id is not a number' do
    expect {
      call('x', double)
    }.to raise_error(ArgumentError).with_message(/"x"/)
  end
end
