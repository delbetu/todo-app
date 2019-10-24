require 'core_helper'

describe UpdateItem do
  it 'updates existing item' do
    fake_user = double('User', has_group?: true)
    demo_item = double('Item', id: 1, title: 'demo', completed: true)
    fake_item_table = double('ItemTable', update: nil)

    UpdateItem.call(
      group_id: 1,
      item_id: 1,
      completed: true,
      title: 'demo',
      user: fake_user,
      data_provider: fake_item_table
    )

    expect(fake_user).to have_received(:has_group?).with(1)
    expect(fake_item_table).to have_received(:update)
  end

  context "when trying to update item in others' group item" do
    let(:fake_user) { double('User', has_group?: false) }

    it 'raises data integrity violation error' do
      demo_item = double('Item', id: 1, title: 'demo', completed: true)
      fake_item_table = double('ItemTable', update: nil)

      expect {
        UpdateItem.call(group_id: 1,
                        item_id: 1,
                        title: 'demo',
                        completed: true,
                        user: fake_user,
                        data_provider: fake_item_table)
      }.to raise_error(Validation::DataIntegrityViolation)
    end
  end
end
