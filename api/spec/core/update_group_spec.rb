require 'core_helper'

describe UpdateGroup do
  it 'updates existing group' do
    demo_group = double('Group', id: 1, title: 'demo', completed: true)
    fake_group_table = double('GroupTable', update: true)

    result = UpdateGroup.call(id: 1,
                           list_title: 'demo',
                           data_provider: fake_group_table)

    expect(fake_group_table).to have_received(:update)
    expect(result).to be_truthy
  end
end
