class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
  end

  def update
  end

  def delete
  end

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find_by_id(params[:id])
  end
end
