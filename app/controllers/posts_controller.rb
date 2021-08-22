class PostsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    render json: {
      posts: Post.all,
      builds: Build.all,
      items: Item.all,
    }
    # "index.json.jb"
  end
  
  def create
    post = Post.new(
      user_id: current_user.id,
      title: params[:title],
      body: params[:body],
      build_id: params[:build_id]
    )
    if post.save
      render json: { message: "Post was created" }, status: :created
    else
      render json: { errors: post.errors.full_messages }, status: :bad_request
    end
  end

  def show
    post = Post.find_by(id: params[:id])
    render json: post.as_json
  end

  def update
    post = Post.find_by(id: params[:id], user_id: current_user.id)
    
    post.title = params[:title] || post.title
    post.body = params[:body] || post.body
    post.build_id = params[:build_id] || post.build_id

    if post.save
      render json: post
    end
  end

  def destroy
    post = Post.find_by(id: params[:id], user_id: current_user.id)

    if post.delete
      render json: {message: "Comment was deleted"}
    end
  end
end
