require 'core_helper'

describe DestroyItem do
  it 'destroy existing item' do
    fake_user = double('User', has_group?: true)
    demo_item = double('Item', id: 1)
    fake_item_table = double('ItemTable', destroy: true)

    result = DestroyItem.call(id: 1, group_id: 1, user: fake_user, data_provider: fake_item_table)

    expect(fake_user).to have_received(:has_group?).with(1)
    expect(fake_item_table).to have_received(:destroy)
    expect(result).to be_truthy
  end

  it 'returns false when destroy fails' do
    fake_user = double('User', has_group?: true)
    demo_item = double('Item', id: 1)
    fake_item_table = double('ItemTable', destroy: false)

    result = DestroyItem.call(id: 1, group_id: 1, user: fake_user, data_provider: fake_item_table)

    expect(result).to be_falsy
  end

  context "when trying to destroy item in others' group item" do
    let(:fake_user) { double('User', has_group?: false) }

    it 'raises data integrity violation error' do
      demo_item = double('Item', id: 1)
      fake_item_table = double('ItemTable', destroy: demo_item)

      expect {
        DestroyItem.call(id: 1, group_id: 1, user: fake_user, data_provider: fake_item_table)
      }.to raise_error(DestroyItem::DataIntegrityViolation)
    end
  end
end
