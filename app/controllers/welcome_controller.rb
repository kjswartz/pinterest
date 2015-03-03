class WelcomeController < ApplicationController
  def index
    @pins = Pin.order('updated_at desc').page(params[:page]).per(50)
  end

end
