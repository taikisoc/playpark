class SchedulesController < ApplicationController
layout '2nd_application', only: [:new,:create,:index]


  def new
     @user = User.find(params[:id])
  end
  def create
    Appointment.create(create_params)
  end
  def index

  end

  private

  def create_params
    params[:send_user] = current_user.id
    params[:recieve_user] = params[:id]
    params.permit(:ask_about, :introduction, :where_go, :send_user, :recieve_user)
  end

end

