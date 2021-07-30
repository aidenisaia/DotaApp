class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    render json: Post.all
  end
  
  def create
    post = Post.new(
      user_id: current_user.id,
      title: params[:title],
      body: params[:body]
    )
    if post.save
      render json: { message: "Post was created" }, status: :created
    else
      render json: { errors: post.errors.full_messages }, status: :bad_request
    end
  end

  def show
    post = Post.find_by(id: params[:id], user_id: current_user.id)
    render json: post.as_json
  end
end
