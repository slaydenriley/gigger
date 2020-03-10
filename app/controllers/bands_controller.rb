class BandsController < ApplicationController
  before_action :authorized
  load_and_authorize_resource

  def new
    @band = Band.new
    #@band.users.build
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
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    redirect_to band_path(@band)
  end

  def destroy
    @band = Band.find_by(params[:id])
    @band.destroy
    redirect_to '/bands'
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
