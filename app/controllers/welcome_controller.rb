class WelcomeController < ApplicationController
  def index
    @pins = Pin.order('created_at desc').page(params[:page]).per(50)
  end

  def search
    @search = params[:q]
    @pins = Pin.where("title like ?", "%#{@search}%").page(params[:page]).per(15)
    render 'pins/index'
  end
end
