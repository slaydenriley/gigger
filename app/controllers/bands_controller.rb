class BandsController < ApplicationController
  def new
    @band = Band.new
    #@band.users.build
    @band.build_genre
  end

  def create
    binding.pry
    @band = current_user.bands.build(band_params)
    if @band.save!
      current_user.bands << @band
      redirect_to band_path(@band)
    else
      @band.build_genre
      render :new
    end
  end

  def join
    @band = Band.find_by_id(params[:band][:id])
    if current_user.bands.exists?(@band.id)
      flash.now[:alert] = "Silly! You are already part of that band"
      render :new
    else
      current_user.bands << @band
      redirect_to band_path(@band)
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
      user_ids:[],
      users:[]
    )
  end

end
