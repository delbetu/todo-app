class V1::ItemsController < ApplicationController
  def index
    user = User.last # TODO: get user from token
    # TODO: improve query
    items = user.group_items.find(params.require(:group_item_id).to_i).list_items
    render json: items
    # TODO: cover rescue
  end

  def show
    item = Item.find(params.require(:id))
    render json: item
  # rescue ActiveRecord::NotFound # TODO: test this case
  #   render json: {  }, status: 404
  end

  def create
    # TODO: validate input
    user = User.last
    title = params.require(:title)
    item = user.group_items.find(params.require(:group_item_id).to_i)
      .list_items.create!(title: title)
    render json: item, status: 200
    # TODO: manage errors
  end

  def update
    title = params.require(:title)
    user = User.last
    item = user.group_items.find(params.require(:group_item_id).to_i)
      .list_items.find(params.require(:id))
    item.update!(title: title)
    render json: item, status: 200
  # rescue not found TODO
  end

  def destroy
    User.last.group_items.find(params.require(:group_item_id))
      .list_items.find(params.require(:id)).destroy!
    render json: {message: 'successfully destroy'}, status: 200
  # rescue TODO: manage this case not found
  end
end
