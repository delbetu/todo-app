require 'rails_helper'

#TODO FIX SPEC TO SUPPORT AUTHENTICATION
describe "Todos API" do
  it 'returns all items in the system' do
    pending
    Item.create(title: "Go to granny's home", completed: false)
    user = User.create(email: 'test@todo.com', password: 'admin')
    get '/api/v1/items', {}, { 'rack.session' => { user_id: user.id } }

    items = JSON.parse(response.body)
    expect(response).to be_success
    expect(items.length).to eq(1)
  end

  it 'returns an item with the given id' do
    pending
    Item.create(title: "Go to granny's home", completed: false)

    get '/api/v1/items/1'

    item = JSON.parse(response.body)
    expect(response).to be_success
    expect(item['id']).to eq(1)
  end

  it 'creates an item' do
    pending
    post '/api/v1/items', { item: { title: "Go to granny's home" } }

    json = JSON.parse(response.body)
    expect(response).to be_success
    item = Item.last
    expect(item.title).to eq("Go to granny's home")
  end

  it 'updates an existing item' do
    pending
    item = Item.create(title: "Go to granny's home", completed: false)

    put "/api/v1/items/#{item.id}", { item: { title: 'new title', completed: true } }

    item = Item.last
    expect(item.title).to eq('new title')
    expect(item.completed).to be_truthy
  end

  it 'deletes an existing item' do
    pending
    Item.create(title: "Go to granny's home", completed: false)

    delete '/api/v1/items/1'

    expect(Item.count).to eq(0)
  end
end
