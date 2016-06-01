class CatRentalRequestsController < ApplicationController
  def index
    @crrs = CatRentalRequest.all
    render :index
  end

  def show
    @crr = CatRentalRequest.find(params[:id])
  end

  def new
    @crr = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @crr = CatRentalRequest.new(crr_params)

    if @crr.save!
      redirect_to cat_url(@crr.cat_id)
    else
      render :new
    end
  end

  def edit
    @crr = CatRentalRequest.find(params[:id])
    render :edit
  end

  def update
    @crr = CatRentalRequest.find(params[:id])
    @crr.update_attributes(crr_params)

    if @crr.status == "APPROVE"
      @crr.approve!
      redirect_to cat_url(@crr.cat_id)
    else
      @crr.deny!
      redirect_to cat_url(@crr.cat_id)
    end
  #
  #   if @crr.save
  #     redirect_to cat_url(@crr.cat_id)
  #   else
  #     redirect_to cat_url(@crr.cat_id)
  #   end
  end

  private
  def crr_params
    params.require(:crr).permit(:cat_id, :start_date, :end_date, :status)
  end
end
