# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @hawker = Hawker.find(params[:hawker_id])
    @comment = @hawker.comments.create(comment_params)
    redirect_to hawker_path(@hawker)
  end

  def edit; end

  private

  def comment_params
    params.require(:comment).permit(:date, :rating, :text)
  end
end
