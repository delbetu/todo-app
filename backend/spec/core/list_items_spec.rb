require 'core_helper'

describe ListItems do
  def call(group_id, user_id, data_provider)
    ListItems.call(ListItems::Params.with(
      group_id: group_id,
      user_id: user_id,
      data_provider: data_provider
    ))
  end

  it 'returns items data'do
    some_data = []
    result = call(1,1, double(for: some_data))

    expect(result.items).to eq(some_data)
  end

  it 'raise argument error when group_id is not convertible to integer' do
    expect {
      call('a', 1, double(for: [1, 2]))
    }.to raise_error(ArgumentError).with_message(/"a"/)
  end

  it 'raise argument error when user_id is not convertible to integer' do
    expect {
      call(1, 'x', double(for: [1, 2]))
    }.to raise_error(ArgumentError).with_message(/"x"/)
  end

  it 'raise argument error when group_id is not convertible to integer' do
    expect {
      call(1, 1, double)
    }.to raise_error(ArgumentError)
  end
end
