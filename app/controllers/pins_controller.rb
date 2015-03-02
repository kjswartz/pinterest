class PinsController < InheritedResources::Base
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def search
    @search = params[:title]
    @pins = Pin.where("title like ?", "%#{@search}%").page(params[:page]).per(15)
    render 'pins/index'
  end

  def index
    # @pins = Pin.all
    @pins = Pin.page(params[:page]).per(15)
  end

  def new
    @pin = Pin.new(:board_id => params[:board_id])
  end

  def pinning

  end

  def edit
  end

  def show
    @new_pin = Pin.new
    @new_pin.title = @pin.title
    @new_pin.image = @pin.image
    @new_pin.description = @pin.description
  end

  def create
    @pin = Pin.new(pin_params)
    # @pin.url = "Pinterest user: #{@pin.board.user.email}" if @pin.url.blank?
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
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
    end
  end
  private
  def set_pin
    @pin = Pin.find(params[:id])
  end

    def pin_params
      params.require(:pin).permit(:board_id, :title, :description, :url, :image, :image_cache, :remove_image, board_ids: [])
    end
end
