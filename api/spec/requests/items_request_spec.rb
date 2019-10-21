require 'rails_helper'

# TODO: Move to helper
def token_for(user)
  Auth::TokenManager.encode(user.id)
end

RSpec.describe V1::ItemsController, type: :request do
  # Given a user with one group item and one item
  let(:user) { User.create!(email: 'user@todo.com', password: 'user')  }
  let(:group_item) { user.group_items.create!(list_title: 'Things to do')  }
  let!(:item) {
    Item.create!(title: "Go to granny's home", completed: false, group_item_id: group_item.id)
  }

  it 'list items for user' do
    get "/api/v1/group_items/#{group_item.id}/items", 'headers': { 'Authorization' => token_for(user) }

    items = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(items.length).to eq(1)
  end

  it 'find item by its id' do
    get "/api/v1/group_items/#{group_item.id}/items/#{item.id}", 'headers': { 'Authorization' => token_for(user) }

    expect(response).to have_http_status(:success)

    result = JSON.parse(response.body)
    expect(result['id']).to eq(item.id)
  end

  it 'creates an item' do
    post "/api/v1/group_items/#{group_item.id}/items",
      params: { title: "Go to granny's home" }, 'headers': { 'Authorization' => token_for(user) }

    json = JSON.parse(response.body)
    expect(response).to have_http_status(:success)

    result = Item.last
    expect(result.title).to eq("Go to granny's home")
  end

  it 'updates an existing item' do
    put "/api/v1/group_items/#{group_item.id}/items/#{item.id}",
      params: { title: 'new title', completed: false }, 'headers': { 'Authorization' => token_for(user) }

    result = Item.last
    expect(result.title).to eq('new title')
  end

  it 'deletes an existing item' do
    delete "/api/v1/group_items/#{group_item.id}/items/#{item.id}", 'headers': { 'Authorization' => token_for(user) }

    expect(Item.count).to eq(0)
  end
end
