module Todos
  class API < Grape::API
    version 'v1'
    format :json
    prefix :api

    resource :items do
      desc 'Returns all items'
      get do
        items = Item.all
        present items
      end

      desc 'Returns an item.'
      params do
        requires :id, type: Integer, desc: 'Item id.'
      end
      get ':id'do
        item = Item.find(params[:id])
        present item
      end

      desc 'Creates an item.'
      params do
        requires :title, type: String, desc: 'Your item title.'
      end
      post do
        item = Item.create!({
          title: params[:title],
          completed: false
        })

        present item
      end

      desc 'Updates an existing item.'
      params do
        requires :id, type: Integer, desc: 'Item id.'
        requires :item, type: Item
      end
      put ':id' do
        item = Item.find(params[:id])
        item.update(params[:item])
        present item
      end

      desc 'Deletes an item.'
      params do
        requires :id, type: Integer, desc: 'Item id to be deleted.'
      end
      delete ':id' do
        item = Item.find(params[:id]).destroy
        present item
      end
    end
  end
end
