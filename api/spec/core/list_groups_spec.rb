require 'core_helper'

describe ListGroups do
  def call(user_id, data_provider)
    ListGroups.call(
      user_id: user_id,
      data_provider: data_provider
    )
  end

  it 'returns groups data'do
    some_data = [::Dto::Group.new(3, 'some title')]
    fake_data_provider = double(list: some_data)
    result = call(1, fake_data_provider)

    expect(result).to eq(some_data)
    expect(fake_data_provider).to have_received(:list).with(filters: { user_id: 1 })
  end
end
