class V1::GroupItemsController < ApplicationController

  def index
    result = ListGroups.call(user_id: current_user.id, data_provider: GroupItem)
    render json: result
  end

  def show
    id = Integer(params.require(:id))
    render json: GetGroup.call(id: id, data_provider: GroupItem)
  end

  def create
    # FIXME: The user authorization is implicit when calling current_user
    # Does every action that needs to be authorized use the current user ?
    list_title = params.require(:list_title).to_s
    group_item = CreateGroup.call(user_id: current_user.id, list_title: list_title, data_provider: GroupItem)
    render json: group_item, status: 200
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
