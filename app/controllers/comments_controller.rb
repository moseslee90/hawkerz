# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment  = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    3.times do
      food = @comment.foods.build
    end
  end

  def create
    # @hawker = Hawker.find(params[:hawker_id])
    # @comment = @hawker.comments.create(comment_params)
    # redirect_to hawker_path(@hawker)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment
    else
      render 'new'
    end
  end

  def edit; end

  private

  def comment_params
    params.require(:comment).permit(:rating, :text, foods_attributes: [:name])
  end
end
