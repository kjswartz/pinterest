class WelcomeController < ApplicationController
  def index
    @pins = Pin.includes(:board => :user).order('updated_at desc').page(params[:page]).per(50)
  end

end
