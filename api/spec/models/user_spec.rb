require "rails_helper"

RSpec.describe Item, :type => :model do
  def expect_to_be_an_item(element)
    expect(element).to respond_to(:id)
    expect(element).to respond_to(:title)
    expect(element).to respond_to(:completed)
  end

  describe '.list' do
    it 'returns items for a given group and user' do
      user, group_item, _ = user_with_group_and_items

    # options[:filters] => { group_item_id: 1, group_items: { user_id: 4 } }
      result = Item.list(filters: { group_items: { user_id: user.id }, group_item_id: group_item.id })

      expect(result).to respond_to(:to_a)
      expect_to_be_an_item(result.first)
    end

    context 'when user does not have the given group' do
      it 'returns empty' do
        user, group_item, _ = user_with_group_and_items

        wrong_group_id = group_item.id + 1
        result = Item.list(filters: { group_items: { user_id: user.id },  group_item_id: wrong_group_id })

        expect(result).to be_empty
      end
    end
  end

  describe '.create' do
    it 'returns generated id when item was saved successfully' do
      id = User.create({name: 'ValidName', email: 'valid@email.com', password: 'ValidPwd1'})
      expect(id).to be_a(Integer)
    end

    it 'raises unique key violation when email is repeated' do
      given_an_exiting_user_with = User.create({name: 'ValidName', email: 'valid@email.com', password: 'ValidPwd1'})
      expect {
        User.create({name: 'ValidName', email: 'valid@email.com', password: 'ValidPwd1'})
      }.to raise_error DataProviderPort::ResourceSavingError
    end
  end
end
