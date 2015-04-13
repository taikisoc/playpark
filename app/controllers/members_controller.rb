class MembersController < ApplicationController
  def index
    @users = User.where(separate: 3).order('id asc').limit(20)
  end
end
