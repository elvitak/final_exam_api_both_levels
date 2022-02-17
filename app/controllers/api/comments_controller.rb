class Api::CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    if comment.persisted?
      render json: { comment: comment }, status: 201
    else
      render json: { message: comment.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

  def comment_params
    params[:comment].permit(:body, :article_id)
  end
end
