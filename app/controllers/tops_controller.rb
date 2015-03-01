class TopsController < ApplicationController
  def index
    @activity = Activity.order('id DESC').limit(1)
  end
  def sign_up
    
  end
  def new
    
  end
  def create
    Activity.create(event_params)
  end

  private
  def event_params
    params.permit(:event_place, :event_station, :event_time, :event_date, :event_people, :event_bring, :event_else, :event_place_img)
  end
end

