class GigsController < ApplicationController
  before_action :authorized
  load_and_authorize_resource

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
    @gig = Gig.find_by_id(params[:id])
    @gig.destroy
    redirect_to '/gigs'
  end

  def index
    @gigs = Gig.all
    @gig = Gig
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
end
