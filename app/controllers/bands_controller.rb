class BandsController < ApplicationController
  def new
    @band = Band.new
    @band.users.build
    @band.build_genre
  end

  def create
    @band = current_user.bands.build(band_params)
    if @band.save!
      current_user.bands << @band
      redirect_to band_path(@band)
    else
      @band.build_genre
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
      genre_attributes:[:name],
      user_ids:[]
    )
  end

end
