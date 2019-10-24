require 'core_helper'

describe CreateGroup do
  it 'creates a new group' do
    generated_id = 222
    demo_group = double('Group', id: 1, list_title: 'demo')
    fake_group_table = double('GroupTable', create: generated_id)

    id = CreateGroup.call(user_id:1, list_title: 'demo', data_provider: fake_group_table)

    expect(fake_group_table).to have_received(:create)
    expect(id).to eq(generated_id)
  end
end
