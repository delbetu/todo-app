class V1::AuthTokenController < ApplicationController
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

    result = Auth::Authenticator.authenticate(email, password, data_provider: User)

    if result.authenticated
      payload = { notice: 'User logged in', token: Auth::TokenManager.encode(result.user.id) }
      status = 200
    else
      payload = { message: '403 Forbidden access' }
      status = 403
    end

    render json: payload, status: status
  rescue ActionController::ParameterMissing => e
    render json: { message: e.message }, status: :bad_request
  rescue => e
    render json: { message: 'Unknown Error' }, status: 500
  end
end
