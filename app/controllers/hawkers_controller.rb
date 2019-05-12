# frozen_string_literal: true

class HawkersController < ApplicationController
  def home
    render 'home'
  end

  def index
    @hawkers = Hawker.all
  end

  def show
    @hawker = Hawker.find(params[:id])
    @comment = Comment.new
    3.times do
      food = @comment.foods.build
    end
  end

  def new
    @hawker = Hawker.new
    3.times do
      image = @hawker.images.build
    end
  end

  def edit
    @hawker = Hawker.find(params[:id])
    @comment = Comment.new
    3.times do
      food = @comment.foods.build
    end
  end

  def create
    @hawker = Hawker.new(hawker_params)

    if @hawker.save
      redirect_to @hawker
    else
      render 'new'
    end
  end

  def update
    @hawker = Hawker.find(params[:id])

    if @hawker.update(hawker_params)
      redirect_to @hawker
    else
      render 'edit'
    end
  end

  def destroy
    @hawker = Hawker.find(params[:id])
    @hawker.destroy

    redirect_to @hawkers_path
  end

  private

  def hawker_params
    params.require(:hawker).permit(
      :name, :description, :address, :hero_image_url,
      :opening_hours, :closing_hours, :latitude, :longitude, :site_url,
      images_attributes: %i[id image_url _destroy]
    )
  end
end
