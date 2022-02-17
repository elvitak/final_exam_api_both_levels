class Api::CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    render json: { comment: comment }, status: 201
  end

  private

  def comment_params
    params[:comment].permit(:body, :article_id)
  end
end
