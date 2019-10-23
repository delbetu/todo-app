require 'core_helper'

describe ListGroups do
  def call(user_id, data_provider)
    ListGroups.call(
      user_id: user_id,
      data_provider: data_provider
    )
  end

  it 'returns groups data'do
    some_data = []
    result = call(1, double(for: some_data))

    expect(result).to eq(some_data)
  end
end
