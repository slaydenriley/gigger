class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
    band = Band.create(band_params)
    binding.pry
    if band.valid?
      redirect_to band_path(band)
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
      users: []
    )
  end

end
