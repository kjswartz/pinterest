class PinsController < InheritedResources::Base
  before_action :set_pin, only: [:show, :update]
  before_action :modify_pin, only: [:destroy, :edit]

  def search
    @search = params[:title]
    @pins = Pin.where("title like ?", "%#{@search}%").order('created_at desc').page(params[:page]).per(15)
    render 'pins/index'
  end

  def index
    redirect_to 'pins/search'
  end

  def new
    @pin = Pin.new(:board_id => params[:board_id])
  end

  def edit
    @new_pin = Pin.find(params[:id])
  end

  def show
    @new_pin = Pin.new
    @new_pin.title = @pin.title
    @new_pin.image = @pin.image
    @new_pin.description = @pin.description
    @new_pin.url = @pin.url
  end

  def create
    @new_pin = Pin.new(pin_params)
    @pin = @new_pin

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Pin was successfully destroyed.' }
    end
  end

  private
  def set_pin
    @pin = Pin.find(params[:id])
  end

  def modify_pin
    @pin = Pin.where(board_id: current_user.board_ids).find_by(id: params[:id])
    redirect_to '/' if @pin.blank?
  end

  def pin_params
    params.require(:pin).permit(:id, :board_id, :title, :description, :url, :image, :image_cache, :remove_image, board_ids: [])
  end
end
