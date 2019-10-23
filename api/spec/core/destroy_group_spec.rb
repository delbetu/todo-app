require 'core_helper'

describe DestroyGroup do
  it 'destroy existing group' do
    demo_group = double('Group', id: 1)
    fake_group_table = double('GroupTable', destroy: true)

    result = DestroyGroup.call(id: 1, data_provider: fake_group_table)

    expect(fake_group_table).to have_received(:destroy)
    expect(result).to be_truthy
  end

  it 'returns false when destroy fails' do
    demo_group = double('Group', id: 1)
    fake_group_table = double('GroupTable', destroy: false)

    result = DestroyGroup.call(id: 1, data_provider: fake_group_table)

    expect(result).to be_falsy
  end
end
