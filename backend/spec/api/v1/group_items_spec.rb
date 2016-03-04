require 'rails_helper'

describe "Todos API" do
  let(:group_item) { GroupItem.create(list_title: 'Things to do') }
  let(:user) { login }

  before do
    user.group_items = [ group_item ]
    user.save
  end

  it 'List group items for user' do
    get "/api/v1/group_items"

    result = JSON.parse(response.body)
    expect(response).to be_success
    expect(result.length).to eq(1)
  end

  it 'Find group item by its id' do
    get "/api/v1/group_items/#{group_item.id}"

    result = JSON.parse(response.body)
    expect(response).to be_success
    expect(result['id']).to eq(group_item.id)
  end

  it 'Creates a group item' do
    post "/api/v1/group_items", { list_title: "TODOS" }

    json = JSON.parse(response.body)
    expect(response).to be_success
    result = GroupItem.last
    expect(result.list_title).to eq("TODOS")
  end

  it 'updates an existing item' do
    put "/api/v1/group_items/#{group_item.id}", {
      list_title: 'new list title'
    }

    result = GroupItem.last
    expect(result.list_title).to eq('new list title')
  end

  it 'deletes an existing item' do
    delete "/api/v1/group_items/#{group_item.id}"

    expect(GroupItem.count).to eq(0)
  end
end
