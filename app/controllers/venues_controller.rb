class VenuesController < ApplicationController
  before_action :authorized
  load_and_authorize_resource

  def new
    @venue = Venue.new
  end

  def create
    @venue = current_user.venues.build(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def edit
    @venue = Venue.find_by_id(params[:id])
  end

  def update
    @venue = Venue.find_by_id(params[:id])
    if @venue.update(venue_params)
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def destroy
    @venue = Venue.find_by_id(params[:id])
    @venue.destroy
    redirect_to '/venues'
  end

  def index
    @venues = Venue.all
    @venue = Venue
  end

  def show
    @venue = Venue.find_by_id(params[:id])
  end

  private

  def venue_params
    params.require(:venue).permit(
      :name,
      :email,
      :description,
      user_ids:[]
    )
  end
end
