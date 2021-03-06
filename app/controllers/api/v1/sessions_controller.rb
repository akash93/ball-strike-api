class Api::V1::SessionsController < ApplicationController

  def create
    user_email = params[:session][:email]
    user_password = params[:session][:password]
    user = user_email.present? && User.find_by(email: user_email)

    if user.nil?
      return render json: { errors: 'No user found' }, status: 404
    end

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_auth_token!
      user.save
      render json: user, serializer: Sessions::CreateSerializer, status: 200, location: [:api, user]
    else
      render json: { errors: 'Invalid credentials' }, status: 403
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_auth_token!
    user.save
    head 204
  end
end
