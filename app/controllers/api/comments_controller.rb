class Api::CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    render json: { comment: comment }, status: 201
  end

  private

  def comment_params
    params[:comment].permit(:body)
  end
end
