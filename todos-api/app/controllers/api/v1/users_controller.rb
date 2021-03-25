# app/controllers/users_controller.rb
class Api::V1::UsersController < ApplicationController

  skip_before_action :authorize_request, only: :create

  def create
    user = User.create!(user_params)

    p " user.password user.password user.password user.password user.password"
    p  user.password
    p user

    auth_token = AuthenticateUser.new(user.email, user.password).call

    response = { message: Message.account_created, auth_token: auth_token }

    json_response(response, :created)
  end


  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end