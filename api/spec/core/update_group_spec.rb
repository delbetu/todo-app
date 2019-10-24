require 'core_helper'

describe UpdateGroup do
  it 'updates existing group' do
    demo_group = double('Group', id: 1, title: 'demo', completed: true)
    fake_group_table = double('GroupTable', update: nil)

    UpdateGroup.call(id: 1,
                     list_title: 'demo',
                     data_provider: fake_group_table)

    expect(fake_group_table).to have_received(:update)
  end
end
