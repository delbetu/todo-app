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
    id = Integer(params.require(:id))
    render json: GetItem.call(id: id, data_provider: Item)
  rescue => e
    Rails.logger.error("Error calling ItemsController#show: #{e.message}")
    render json: { errors: [ 'Unknown error' ] }, status: 500
  end

  def create
    title = params.require(:title)
    group_id = params.require(:group_item_id).to_i

    new_item = CreateItem.call(group_id: group_id, title: title, user: current_user, data_provider: Item)

    render json: new_item, status: 200
  rescue CreateItem::DataIntegrityViolation => e
    Rails.logger.info("Suspicious activity: User #{user.id} tried to create items in other's group_items")
    render json: { errors: [ e.message ] }, status: 403#forbidden
  end


  # FIXME: this enforces to send all attributes no matter if client needs to change only one.
  def update
    title = params.require(:title)
    completed = params.require(:completed).downcase == 'true'
    group_item_id = params.require(:group_item_id).to_i
    item_id = params.require(:id).to_i

    updated = UpdateItem.call(user: current_user,
                    group_id: group_item_id,
                    item_id: item_id,
                    title: title,
                    completed: completed,
                    data_provider: Item)

    if updated
      render json: { message: 'Item updated successfully' }, status: 200
    else
      render json: { errors: ['Item not found'] }, status: 404
    end

  rescue UpdateItem::DataIntegrityViolation => e
    Rails.logger.info("Suspicious activity: User #{user.id} tried to update items in other's group_items")
    render json: { errors: [ e.message ] }, status: 403#forbidden
  end

  def destroy
    item_id = Integer(params.require(:id))
    group_id = Integer(params.require(:group_item_id))

    success = DestroyItem.call(id: item_id, group_id: group_id, user: current_user, data_provider: Item)

    if success
      render json: {message: 'successfully destroy'}, status: 200
    else
      render json: { errors: ['Item not found'] }, status: 404
    end
  end
end
