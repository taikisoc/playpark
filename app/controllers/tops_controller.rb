class TopsController < ApplicationController
  def index
    if params[:keyword].present?
      @activities = Activity.where('event_place LIKE ?', "%#{params[:keyword]}%").page(params[:page]).order('id DESC').limit(2)
    else
      @activities = Activity.page(params[:page]).per(2).order('id desc')
    end
     @nextacts = Nextact.order('id desc').limit(1)
  end

  def sign_up
    
  end

  def new
    
  end

  def show
    @activity = Activity.find(params_show[:id])
  end

  def create
    Activity.create(event_params)
  end

  def edit
    @activity = Activity.find(params_edit[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(event_params)
  end

  private
  def event_params
    params.permit(:event_place, :event_station, :event_time, :event_date, :event_people, :event_bring, :event_else, :event_place_img,:event_what,:event_img1,:event_img2,:event_img3,:event_p_img)
  end

  def params_edit
    params.permit(:id)
  end

  def params_show
    params.permit(:id)
  end

end
