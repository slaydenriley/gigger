class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
    @venue = current_user.venues.build(venue_params)
    if @venue.save!
      current_user.venues << @venue
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def join
    @venue = Venue.find_by_id(params[:venue][:id])
    if current_user.venues.exists?(@venue.id)
      flash.now[:alert] = "Silly! You already manage this venue!"
      render :new
    else
      current_user.venues << @venue
      redirect_to venue_path(@venue)
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue = Venue.find_by(params[:id])
    @venue.destroy
    redirect_to '/venues'
  end

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find_by_id(params[:id])
  end

  private

  def venue_params
    params.require(:venue).permit(
      :name,
      :email,
      :description
    )
  end
end
