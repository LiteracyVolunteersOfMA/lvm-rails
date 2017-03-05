class AffiliateEventsController < ApplicationController
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
    @affiliate_event = AffiliateEvent.find(params[:id])
    @tutor = Tutor.find(@affiliate_event.tutor_id)
  end

  def update
    @affiliate_event = AffiliateEvent.find(params[:id])

    if @affiliate_event.update(affiliate_event_params)
      redirect_to tutor_path(affiliate_event_params[:tutor_id])
    else
      @tutor = Tutor.find(affiliate_event_params[:tutor_id])
      render :edit
    end
  end

  def destroy
    @affiliate_event = AffiliateEvent.find(params[:id])
    @affiliate_event.destroy

    @tutor = Tutor.find(@affiliate_event.tutor_id)

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
end
