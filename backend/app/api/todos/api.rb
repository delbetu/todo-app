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
    end
  end
end
