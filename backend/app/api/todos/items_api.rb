module Todos
  class ItemsApi < Grape::API
    namespace :group_item do
      route_param :group_item_id do
        resource :items do
          before do
            authorize!
          end

          desc 'Returns all items'
          get do
            group_items = current_user.group_items
            items = group_items.find(params[:group_item_id]).list_items
            present items
          end

          desc 'Returns an item.'
          params do
            requires :group_item_id, type: Integer, desc: 'Item id.'
            requires :id, type: Integer, desc: 'Item id.'
          end
          get ':id' do
            item = Item.find(params[:id])
            present item
          end

          desc 'Creates an item.'
          params do
            requires :title, type: String, desc: 'Your item title.'
          end
          post do
            group_item = current_user.group_items.find(params[:group_item_id])
            item = group_item.list_items.create!(params.to_h)

            present item
          end

          desc 'Updates an existing item.'
          params do
            requires :id, type: Integer, desc: 'Item id.'
            optional :title, type: String
            optional :completed, type: Boolean
            at_least_one_of :title, :completed
          end
          put ':id' do
            item = Item.find(params[:id])
            item.update(params.to_h)
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
  end
end
