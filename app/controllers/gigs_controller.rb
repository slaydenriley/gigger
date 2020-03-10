class GigsController < ApplicationController
  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.create(gig_params)
    if @gig.valid?
      current_user.gigs << @gig
      redirect_to gig_path(@gig)
    else
      render :new
    end
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

  private

  def gig_params
    params.require(:gig).permit(
      :name,
      :band_id,
      :venue_id
    )
  end
end
