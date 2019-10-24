require 'core_helper'

describe CreateItem do
  it 'creates a new item' do
    generated_id = 444
    fake_user = double('User', has_group?: true)
    demo_item = double('Item', id: 1, title: 'demo', completed: true)
    fake_item_table = double('ItemTable', create: generated_id)

    id = CreateItem.call(group_id: 1, title: 'demo', user: fake_user, data_provider: fake_item_table)

    expect(fake_user).to have_received(:has_group?).with(1)
    expect(fake_item_table).to have_received(:create)
    expect(id).to eq(generated_id)
  end

  context "when trying to create item in others' group item" do
    let(:fake_user) { double('User', has_group?: false) }

    it 'raises data integrity violation error' do
      demo_item = double('Item', id: 1, title: 'demo', completed: true)
      fake_item_table = double('ItemTable', create: demo_item)

      expect {
        CreateItem.call(group_id: 1, title: 'demo', user: fake_user, data_provider: fake_item_table)
      }.to raise_error(Validation::DataIntegrityViolation)
    end
  end
end
