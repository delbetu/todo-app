require 'core_helper'

describe CreateGroup do
  it 'creates a new group' do
    demo_group = double('Group', id: 1, list_title: 'demo')
    fake_group_table = double('GroupTable', create: demo_group)

    group = CreateGroup.call(user_id:1, list_title: 'demo', data_provider: fake_group_table)

    expect(fake_group_table).to have_received(:create)
    expect(group).to be_a(::Dto::Group)
  end
end
