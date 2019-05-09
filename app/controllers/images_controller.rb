# frozen_string_literal: true

class ImagesController < ApplicationController
  def create
    @hawker = Hawker.find(params[:hawker_id])
    @image = @hawker.images.create(image_params)
    redirect_to hawker_path(@hawker)
  end

  private

  def image_params
    params.require(:image).permit(:image_url)
  end
end
