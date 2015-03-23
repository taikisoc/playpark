class StudentsController < ApplicationController
  layout '2nd_application', only: [:show,:edit,:update]
  def index
    @users = User.where(separate: 3).order('id asc').limit(20)
  end

  def edit
     @user = User.find(current_user.id)
  end

  def show
    @user = User.find(show_params[:id])
  end

  def update
    user = User.find(current_user.id)
    user.update(update_params)
  end

  private
  def update_params
    params.permit(:fullname, :introduction,:hobby_1,:hobby_2,:hobby_3)
  end

  def edit_params
    params.permit(:id)
  end

  def show_params
    params.permit(:id)
  end
end


