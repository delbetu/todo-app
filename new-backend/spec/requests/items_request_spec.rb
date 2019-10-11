require 'rails_helper'

RSpec.describe V1::ItemsController, type: :request do
  # Given a user with one group item and one item
  let(:user) { User.create!(email: 'user@todo.com', password: 'user')  }
  let(:group_item) { user.group_items.create!(list_title: 'Things to do')  }
  let!(:item) {
    Item.create!(title: "Go to granny's home", completed: false, group_item_id: group_item.id)
  }

  it 'list items for user' do
    get "/api/v1/group_items/#{group_item.id}/items"

    items = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(items.length).to eq(1)
  end

  it 'find item by its id' do
    get "/api/v1/group_items/#{item.id}"

    expect(response).to have_http_status(:success)

    result = JSON.parse(response.body)
    expect(result['id']).to eq(item.id)
  end

  it 'creates an item' do
    post "/api/v1/group_items/#{group_item.id}/items",
      params: { title: "Go to granny's home" }

    json = JSON.parse(response.body)
    expect(response).to have_http_status(:success)

    result = Item.last
    expect(result.title).to eq("Go to granny's home")
  end

  it 'updates an existing item' do
    put "/api/v1/group_items/#{group_item.id}/items/#{item.id}",
      params: { title: 'new title' }

    result = Item.last
    expect(result.title).to eq('new title')
  end

  it 'deletes an existing item' do
    delete "/api/v1/group_items/#{group_item.id}/items/#{item.id}"

    expect(Item.count).to eq(0)
  end
end
