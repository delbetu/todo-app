require 'core_helper'

describe DestroyGroup do
  it 'destroy existing group' do
    fake_group_table = double('GroupTable', destroy: nil)

    DestroyGroup.call(id: 1, data_provider: fake_group_table)

    expect(fake_group_table).to have_received(:destroy).with(1)
  end

  it 'raise error when destroy fails' do
    fake_group_table = double('GroupTable', destroy: nil)
    MyError = Class.new(StandardError)
    allow(fake_group_table).to receive(:destroy).and_raise(MyError)

    expect{
      DestroyGroup.call(id: 1, data_provider: fake_group_table)
    }.to raise_error(MyError)
  end
end
