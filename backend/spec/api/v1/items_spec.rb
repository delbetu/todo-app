require 'rails_helper'

describe "Todos API" do
  it 'returns all items in the system' do
    Item.create(title: "Go to granny's home", completed: false)

    get '/api/v1/items'

    items = JSON.parse(response.body)
    expect(response).to be_success
    expect(items.length).to eq(1)
  end
end
