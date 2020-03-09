class BandsController < ApplicationController
  def new
    @band = Band.new
    @band.users.build
  end

  def create
    @band = Band.new(band_params)
    binding.pry
    if @band.save
      redirect_to band_path(@band)
    else
      render :new
    end
  end

  def show
    @band = Band.find_by_id(params[:id])
  end

  def edit
    @band = Band.find_by_id(params[:id])
  end

  def update
  end

  def delete
  end

  def index
    @bands = Band.all
  end

  private

  def band_params
    params.require(:band).permit(
      :name,
      :email,
      :description,
      :genre_id,
      user_ids:[]
    )
  end

end
