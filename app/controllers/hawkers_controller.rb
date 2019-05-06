# frozen_string_literal: true

class HawkersController < ApplicationController
  def index
    @hawkers = Hawker.all
  end

  def show
    @hawker = Hawker.find(params[:id])
  end

  def new
    @hawker = Hawker.new
  end

  def edit
    @hawker = Hawker.find(params[:id])
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
    params.require(:hawker).permit
  end
end
