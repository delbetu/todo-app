module Todos
  class GroupItemsApi < Grape::API
    resource :group_items do
      before do
        authorize!
      end

      desc "Returns user's group_items"
      get do
        present current_user.group_items
      end

      desc 'Returns a group_item.'
      params do
        requires :id, type: Integer, desc: 'Group item id.'
      end
      get ':id'do
        group_item = current_user.group_items.find(params[:id])
        present group_item
      end

      desc 'Creates a group_item.'
      params do
        requires :list_title, type: String, desc: 'group_item title.'
      end
      post do
        group_item = current_user.group_items.create!(params.to_h)

        present group_item
      end

      desc 'Updates an existing group_item.'
      params do
        requires :id, type: Integer, desc: 'Group item id.'
        requires :list_title, type: String
      end
      put ':id' do
        group_item = current_user.group_items.find(params[:id])

        group_item.update(params.to_h)
        present group_item
      end

      desc 'Deletes a group_item.'
      params do
        requires :id, type: Integer, desc: 'Group item id to be deleted.'
      end
      delete ':id' do
        group_item = current_user.group_items.find(params[:id]).destroy
        present group_item
      end
    end
  end
end
