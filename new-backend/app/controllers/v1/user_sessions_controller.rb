class V1::UserSessionsController < ApplicationController
  # TODO: Refactor
  def create
    filtered_params = params.require(:user_session).permit(:email, :password)
    email = filtered_params.require(:email)
    password = filtered_params.require(:password)

    token = request.headers['Authorization']
    decoded_token = decode(token)

    user = User.find_by(id: decoded_token.user_id)

    if user
      payload, status = { notice: 'User already logged in' }, 200
      return render json: payload, status: status
    end

    user = User.authenticate(email, password)

    if user
      payload, status = { notice: 'User logged in', token: encode(user.id) }, 200
    else
      payload, status = { message: '403 Forbidden access' }, 403
    end

    render json: payload, status: status
  rescue ActionController::ParameterMissing => e
    render json: { message: e.message }, status: :bad_request
  rescue => e
    render json: { message: 'Unknown Error' }, status: 500
  end

  def decode(token)
    OpenStruct.new(user_id: token)
  end

  def encode(user_id)
    user_id
  end
end
