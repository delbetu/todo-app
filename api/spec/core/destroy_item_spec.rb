require 'core_helper'

describe DestroyItem do
  it 'destroy existing item' do
    fake_user = double('User', has_group?: true)
    demo_item = double('Item', id: 1)
    fake_item_table = double('ItemTable', destroy: nil)

    DestroyItem.call(id: 1, group_id: 1, user: fake_user, data_provider: fake_item_table)

    expect(fake_user).to have_received(:has_group?).with(1)
    expect(fake_item_table).to have_received(:destroy)
  end

  it 'raise error when destroy fails' do
    fake_user = double('User', has_group?: true)
    demo_item = double('Item', id: 1)
    fake_item_table = double('ItemTable')
    DestroyFailure = Class.new(StandardError)
    allow(fake_item_table).to receive(:destroy).and_raise(DestroyFailure)

    expect {
      DestroyItem.call(id: 1, group_id: 1, user: fake_user, data_provider: fake_item_table)
    }.to raise_error(DestroyFailure)
  end

  context "when trying to destroy item in others' group item" do
    let(:fake_user) { double('User', has_group?: false) }

    it 'raises data integrity violation error' do
      demo_item = double('Item', id: 1)
      fake_item_table = double('ItemTable', destroy: demo_item)

      expect {
        DestroyItem.call(id: 1, group_id: 1, user: fake_user, data_provider: fake_item_table)
      }.to raise_error(Validation::DataIntegrityViolation)
    end
  end
end
