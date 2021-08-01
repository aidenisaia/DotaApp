class CommentsController < ApplicationController
  before_action :authenticate_user

  def index
    render json: Comment.all
  end

  def create
    comment = Comment.new(
      user_id: current_user.id,
      post_id: params[:post_id],
      body: params[:body]
    )
    if comment.save
      render json: { message: "Comment was created" }, status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :bad_request
    end
  end

  def show
    comment = Comment.find_by(id: params[:id])
    render json: comment.as_json
  end

  def update
    comment = Comment.find_by(id: params[:id], user_id: current_user.id)
    
    comment.body = params[:body] || comment.body

    if comment.save
      render json: comment
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], user_id: current_user.id)

    if comment.delete
      render json: {message: "#{comment.title} was deleted"}
    end
  end

end
