class AffiliateEventsController < ApplicationController
  before_action :set_affiliate_event, only: [:edit, :update, :destroy]

  def new
    @affiliate_event = AffiliateEvent.new
    @tutor = Tutor.find(params[:tutor])
  end

  def create
    @affiliate_event = AffiliateEvent.new(affiliate_event_params)

    if @affiliate_event.save
      redirect_to tutor_path(affiliate_event_params[:tutor_id])
    else
      @tutor = Tutor.find(affiliate_event_params[:tutor_id])
      render :new
    end
  end

  def edit
    @tutor = Tutor.find(@affiliate_event.tutor_id)
  end

  def update
    if @affiliate_event.update(affiliate_event_params)
      redirect_to tutor_path(affiliate_event_params[:tutor_id])
    else
      @tutor = Tutor.find(affiliate_event_params[:tutor_id])
      render :edit
    end
  end

  def destroy
    @tutor = Tutor.find(@affiliate_event.tutor_id)
    @affiliate_event.destroy

    redirect_to tutor_path(@tutor)
  end

  private

  def affiliate_event_params
    params.require(:affiliate_event).permit(
      :title,
      :date,
      :tutor_id
    )
  end

  def set_affiliate_event
    @affiliate_event = AffiliateEvent.find(params[:id])
  end
end
