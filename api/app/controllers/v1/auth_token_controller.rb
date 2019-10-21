class V1::AuthTokenController < ApplicationController
  # TODO: Refactor
  def create
    # FIXME: user_session is deprecated must be removed after all clients stop using it.
    params_key = if params[:credentials].present?
                   params.require(:credentials)
                 else
                   params.require(:user_session)
                 end
    filtered_params = params_key.permit(:email, :password)
    email = filtered_params.require(:email)
    password = filtered_params.require(:password)

    user = User.authenticate(email, password)

    if user
      payload, status = { notice: 'User logged in', token: Auth::TokenManager.encode(user.id) }, 200
    else
      payload, status = { message: '403 Forbidden access' }, 403
    end

    render json: payload, status: status
  rescue ActionController::ParameterMissing => e
    render json: { message: e.message }, status: :bad_request
  rescue => e
    render json: { message: 'Unknown Error' }, status: 500
  end
end
