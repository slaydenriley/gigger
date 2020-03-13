class BandsController < ApplicationController
  before_action :authorized
  load_and_authorize_resource

  def new
    @band = Band.new
    @band.build_genre
  end

  def create
    @band = current_user.bands.build(band_params)
    if @band.save
      redirect_to band_path(@band)
    else
      flash[:alert] = "Band must have a genre! Please select an existing genre or create a new one."
      @band.build_genre
      render :new
    end
  end

  def show
    @band = Band.find_by_id(params[:id])
  end

  def edit
    @band = Band.find_by_id(params[:id])
    #@band.build_genre
  end

  def update
    @band = Band.find_by_id(params[:id])
    if @band.update(band_params)
      redirect_to band_path(@band)
    else
      flash[:alert] = "Band must have a genre! Please select an existing genre or create a new one."
      @band.build_genre
      redirect_to edit_band_path
    end
  end

  def destroy
    @band = Band.find_by(params[:id])
    @band.destroy
    redirect_to '/bands'
  end

  def index
    @bands = Band.all
    @band = Band
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
