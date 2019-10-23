class V1::GroupItemsController < ApplicationController

  def index
    result = ListGroups.call(user_id: current_user.id, data_provider: GroupItem)
    render json: result
  end

  def show
    id = Integer(params.require(:id))
    render json: GetGroup.call(id: id, data_provider: GroupItem)
  # rescue ActiveRecord::NotFound # TODO: test this case
  #   render json: {  }, status: 404
  end

  def create
    # TODO: validate input
    list_title = params.require(:list_title)
    group_item = current_user.group_items.create!(list_title: list_title)
    render json: group_item, status: 200
    # TODO: manage errors
  end

  def update
    list_title = params.require(:list_title)
    group_item = GroupItem.find(params.require(:id))
    group_item.update(list_title: list_title)
    render json: group_item, status: 200
  # rescue not found TODO
  end

  def destroy
    current_user.group_items.find(params.require(:id)).destroy
    render json: {message: 'successfully destroy'}, status: 200
  # rescue TODO: manage this case not found
  end
end
