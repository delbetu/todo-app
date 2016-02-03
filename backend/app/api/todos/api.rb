module Todos
  class API < Grape::API
    version 'v1'
    format :json
    prefix :api

    resource :items do
      desc 'Returns all items'
      get do
        Item.all
      end

      desc 'Returns an item.'
      params do
        requires :id, type: Integer, desc: 'Item id.'
      end
      route_param :id do
        get do
          Item.find(params[:id])
        end
      end

      desc 'Creates an item.'
      params do
        requires :title, type: String, desc: 'Your item title.'
      end
      post do
        Item.create!({
          title: params[:title],
          completed: false
        })
      end

      desc 'Updates an existing item.'
      params do
        requires :id, type: Integer, desc: 'Item id.'
        requires :item, type: Item
      end
      route_param :id do
        put do
          item = Item.find(params[:id])
          item.update(params[:item])
        end
      end

      desc 'Deletes an item.'
      params do
        requires :id, type: Integer, desc: 'Item id to be deleted.'
      end
      route_param :id do
        delete do
          Item.find(params[:id]).destroy
        end
      end
    end
  end
end
