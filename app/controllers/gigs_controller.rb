class GigsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @gig = Gig.find_by_id(params[:id])
  end

  def update
  end

  def delete
  end

  def index
    @gigs = Gig.all
  end
end
