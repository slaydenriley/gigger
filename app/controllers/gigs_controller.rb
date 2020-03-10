class GigsController < ApplicationController
  before_action :gig_authorized
  skip_before_action :gig_authorized, only: [:index, :show]

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.create(gig_params)
    if @gig.valid?
      redirect_to gig_path(@gig)
    else
      render :new
    end
  end

  def show
    @gig = Gig.find_by(id: params[:id])
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    @gig.update(gig_params)
    redirect_to gig_path(@gig)
  end

  def destroy
    @gig = Gig.find_by(params[:id])
    @gig.delete
    redirect_to gig_path
  end

  def index
    @gigs = Gig.all
  end

  private

  def gig_params
    params.require(:gig).permit(
      :name,
      :band_id,
      :venue_id,
      :date
    )
  end

  def gig_authorized
    redirect_to '/gigs' unless current_user.account_type == ("band_member" || "venue_manager")
  end
end
