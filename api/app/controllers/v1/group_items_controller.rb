class V1::GroupItemsController < ApplicationController

  def index
    result = ListGroups.call(user_id: current_user.id, data_provider: GroupItem)

    render json: result, status: 200
  end

  def show
    authorize_user
    id = Integer(params.require(:id))

    render json: GetGroup.call(id: id, data_provider: GroupItem), status: 200
  end

  def create
    authorize_user
    list_title = params.require(:list_title).to_s
    group_id = CreateGroup.call(user_id: current_user.id, list_title: list_title, data_provider: GroupItem)

    render json: { id: group_id }, status: 200
  rescue DataProviderPort::ResourceSavingError => e
    render json: { errors: [ e.message ] }, status: 500
  end

  def update
    authorize_user
    list_title = params.require(:list_title)
    id = Integer(params.require(:id))

    UpdateGroup.call(id: id, list_title: list_title, data_provider: GroupItem)

    render json: { message: 'Group updated successfully' }, status: 200
  rescue DataProviderPort::ResourceNotFound => e
    render json: { errors: [ e.message ] }, status: 404
  rescue DataProviderPort::ResourceSavingError => e
    render json: { errors: [ e.message ] }, status: 500
  end

  def destroy
    authorize_user
    id = Integer(params.require(:id))
    success = DestroyGroup.call(id: id, data_provider: GroupItem)

    render json: { message: 'Group destroyed successfully' }, status: 200
  rescue DataProviderPort::ResourceNotFound => e
    render json: { errors: [e.message] }, status: 404
  end
end
