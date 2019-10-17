class V1::ItemsController < ApplicationController

  def index
    result = ListItems.call(
      group_id: Integer(params.require(:group_item_id)),
      user_id: current_user.id,
      data_provider: Item
    )
    render json: result, status: 200
  rescue ArgumentError => e
    render json: { errors: 'Invalid parameters'}, status: :bad_request # 400
  rescue => e
    Rails.logger.error("Error calling ItemsController#index: #{e.message}")
    render json: { errors: [ 'Unknown error' ] }, status: 500
  end

  def show
    item = Item.find(params.require(:id))
    render json: item
  # rescue ActiveRecord::NotFound # TODO: test this case
  #   render json: {  }, status: 404
  end

  def create
    # TODO: validate input
    title = params.require(:title)
    item = current_user.group_items.find(params.require(:group_item_id).to_i)
      .list_items.create!(title: title)
    render json: item, status: 200
    # TODO: manage errors
  end

  def update
    title = params.require(:title)
    completed = params.require(:completed)
    item = current_user.group_items.find(params.require(:group_item_id).to_i)
      .list_items.find(params.require(:id))
    item.update!(title: title, completed: completed)
    render json: item, status: 200
  # rescue not found TODO
  end

  def destroy
    current_user.group_items.find(params.require(:group_item_id))
      .list_items.find(params.require(:id)).destroy!
    render json: {message: 'successfully destroy'}, status: 200
  # rescue TODO: manage this case not found
  end
end
