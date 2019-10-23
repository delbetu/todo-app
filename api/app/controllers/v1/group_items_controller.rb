class V1::GroupItemsController < ApplicationController

  def index
    result = ListGroups.call(user_id: current_user.id, data_provider: GroupItem)
    render json: result
  end

  def show
    authorize_user
    id = Integer(params.require(:id))
    render json: GetGroup.call(id: id, data_provider: GroupItem)
  end

  def create
    authorize_user
    list_title = params.require(:list_title).to_s
    group_item = CreateGroup.call(user_id: current_user.id, list_title: list_title, data_provider: GroupItem)
    render json: group_item, status: 200
  end

  def update
    authorize_user
    list_title = params.require(:list_title)
    id = Integer(params.require(:id))

    success = UpdateGroup.call(id: id, list_title: list_title, data_provider: GroupItem)

    if success
      render json: { message: 'Group updated successfully' }, status: 200
    else
      render json: { errors: ['Group not found'] }, status: 404
    end
  end

  def destroy
    authorize_user
    id = Integer(params.require(:id))
    success = DestroyGroup.call(id: id, data_provider: GroupItem)

    if success
      render json: { message: 'Group destroyed successfully' }, status: 200
    else
      render json: { errors: ['Group not found'] }, status: 404
    end
  end
end
