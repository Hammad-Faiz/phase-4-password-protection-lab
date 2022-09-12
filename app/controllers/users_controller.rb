class UsersController < ApplicationController

  def create 
    user = User.create!(params_user)
    if user.valid? 
      session[:user_id] = user.id
      return json: user, status: :created 
    else  
      render json: {error: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show 
    user = User.find(id: session[:user_id])
    render json: user
  end

  private 
  def params_user 
    params.permit(:username, :password_digest, :password_confirmation)
  end

  

end
