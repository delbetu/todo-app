module Todos
  class API < Grape::API
    use Rack::Session::Cookie
    version 'v1'
    format :json
    prefix :api

    helpers do
      def session
        env['rack.session']
      end

      def current_user=(user)
        session[:user_id] = user.nil? ? nil : user.id
      end

      def current_user
        User.find(session[:user_id]) if session[:user_id]
      end

      def authorize!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(message: e.message, status: 404)
    end

    resource :user_session do
      desc 'Create user session'
      params do
        requires :email, type: String
        requires :password, type: String
      end
      post do
        return { notice: 'User already logged in' } if current_user

        user = User.authenticate(params[:email], params[:password])
        if user
          self.current_user = user
          { notice: 'User logged in' }
        else
          error!('403 Forbidden access', 403)
        end
      end

      desc 'Destroy user session'
      delete do
        authorize!
        self.current_user = nil
        { notice: 'User logged out' }
      end
    end

    resource :items do
      before do
        authorize!
      end

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
        requires :item, type: Hash do
          requires :title, type: String, desc: 'Your item title.'
        end
      end
      post do
        item = Item.create!(params[:item])

        present item
      end

      desc 'Updates an existing item.'
      params do
        requires :id, type: Integer, desc: 'Item id.'
        requires :item, type: Hash do
          optional :title, type: String
          optional :completed, type: Boolean
          at_least_one_of :title, :completed
        end
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

    resource :group_items do
      before do
        authorize!
      end

      desc 'Returns all group_items'
      get do
        GroupItem.all
      end
    end
  end
end
