class NextactsController < ApplicationController
  def new
    @nextact = Nextact.new
  end

  def create
    Nextact.create(create_params)
  end

  private
  def create_params
    params.permit(:event_place,:event_date,:event_what,:event_time)
  end
end
