require 'rails_helper'

describe "Todos API" do
  let(:item) { Item.create(title: "Go to granny's home", completed: false) }
  let(:group_item) { GroupItem.create(list_title: 'Things to do', list_items: [ item ]) }
  let(:user) { login }

  before do
    user.group_items = [ group_item ]
    user.save
  end

  it 'returns items within group item' do
    get "/api/v1/group_item/#{group_item.id}/items"

    items = JSON.parse(response.body)
    expect(response).to be_success
    expect(items.length).to eq(1)
  end

  it 'returns an item within group item' do
    get "/api/v1/group_item/#{group_item.id}/items/1"

    item = JSON.parse(response.body)
    expect(response).to be_success
    expect(item['id']).to eq(1)
  end

  it 'creates an item' do
    post "/api/v1/group_item/#{group_item.id}/items", { title: "Go to granny's home" }

    json = JSON.parse(response.body)
    expect(response).to be_success
    item = Item.last
    expect(item.title).to eq("Go to granny's home")
  end

  it 'updates an existing item' do
    put "/api/v1/group_item/#{group_item.id}/items/#{item.id}", { title: 'new title', completed: true }

    item = Item.last
    expect(item.title).to eq('new title')
    expect(item.completed).to be_truthy
  end

  it 'deletes an existing item' do
    delete "/api/v1/group_item/#{group_item.id}/items/#{item.id}"

    expect(Item.count).to eq(0)
  end
end
