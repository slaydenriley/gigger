class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
  end

  def show
    @band = Band.find_by_id(params[:id])
  end

  def update
  end

  def delete
  end

  def index
    @bands = Band.all
  end
end
