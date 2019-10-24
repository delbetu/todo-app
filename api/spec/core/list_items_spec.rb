require 'core_helper'

describe ListItems do
  def call(group_id, user_id, data_provider)
    ListItems.call(
      group_id: group_id,
      user_id: user_id,
      data_provider: data_provider
    )
  end

  it 'returns items data'do
    some_data = []
    fake_data_provider = double(list: some_data)
    result = call(1, 2, fake_data_provider)

    expect(result).to eq(some_data)
    filters = { group_item_id: 1, group_items: { user_id: 2 } }
    expect(fake_data_provider).to have_received(:list).with(filters: filters)
  end

  it 'returns items data'do
    fake_data_provider = double(list: [])
    ListError = Class.new(StandardError)
    allow(fake_data_provider).to receive(:list).and_raise(ListError)

    expect {
      call(1,1, fake_data_provider)
    }.to raise_error(ListError)
  end
end
