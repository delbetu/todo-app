class V1::UsersController < ApplicationController
  def create
    filtered_params = params.require(:user).permit(:name, :email, :password)
    name = filtered_params[:name]
    email = filtered_params[:email]
    password = filtered_params[:password]

    id = SignupUser.call({name: name, email: email, password: password, data_provider: User })

    render json: { id: id }, status: 200
  rescue DataProviderPort::ResourceSavingError => e
    render json: { errors: [ e.message ] }, status: 422 # Unprocessable entity
  rescue SignupUser::UserData::InvalidData => e
    render json: { errors: [ e.message ] }, status: 422 # Unprocessable entity
  end
end
