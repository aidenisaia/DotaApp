class UsersController < ApplicationController
  before_action :authenticate_user, only: [:destroy]

  def index
    render json: User.all
  end

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User was created" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user.as_json
  end

  # def destroy
  #   if current_user.id == params[:id]
  #     user = User.find_by(id: params[:id])
  #     if  user.delete
  #       render json: {message: "#{user.username} was destroyed"}
  #     else
  #       render json: {Error: "You can't destroy this user"}
  #     end
  #   end
  # end
  
end
