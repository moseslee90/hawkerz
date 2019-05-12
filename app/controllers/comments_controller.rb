# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  def index
    @comments = Comment.all
  end

  def show
    @comment  = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new

    food = @comment.foods.build
  end

  def create
    @hawker = Hawker.find(params[:hawker_id])
    @comment = @hawker.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    # @comment.user = current_user
    # @comment.save
    redirect_to hawker_path(@hawker)
    # @comment = Comment.new(comment_params)
  end

  def edit; end

  private

  def comment_params
    params.require(:comment).permit(:rating, :text, foods_attributes: %i[name _destroy])
  end
end
