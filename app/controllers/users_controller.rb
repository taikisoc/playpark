class UsersController < ApplicationController
def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        #　保存後にUserMailerにウェルカムメールを送信するように指示
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
