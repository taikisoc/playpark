class ParkController < ApplicationController
  def index
    if params[:keyword].present?
      @parks = Park.where('park_name LIKE ?', "%#{params[:keyword]}%").page(params[:page]).per(8).order('id asc')
    else
      @parks = Park.page(params[:page]).per(8).order('id asc')
    end
  end
  # def search
  #   @parks = Park.where('title LIKE(?)', "#{search_params[:keyword]}")
  # end
end
