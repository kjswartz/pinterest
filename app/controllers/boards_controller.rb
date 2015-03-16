class BoardsController < InheritedResources::Base
  before_action :set_board, only: [:show, :edit, :update, :destroy, :new]

  def index
    @user = User.where(id: current_user).find_by(id: params[:user_id])
      if @user.nil?
        redirect_to root_path, alert: "Ah Ah Ah...You didn't say the magic word..."
      else
        @boards = @user.boards.order('updated_at desc')
      end
  end

  def new
    @board = @user.boards.new
  end

  def edit
  end

  def show
  end

  def create
    @user = User.find(params[:user_id])
    @board = @user.boards.new(board_params)
      respond_to do |format|
      if @board.save
        format.html {redirect_to [@board.user, @board], notice: 'Board was successfully created.'}
      else
        format.html { render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to([@board.user, @board], notice: 'Board was successfully updated.')}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user), notice: 'Board was successfully destroyed.' }
    end
  end

  private
    def set_board
      # @board = Board.find(params[:id])
      @user = User.where(id: current_user).find_by(id: params[:user_id])
      if @user.nil?
        redirect_to root_path, alert: "Ah Ah Ah...You didn't say the magic word..."
      else
        @board = @user.boards.find(params[:id])
      end
    end

    def board_params
      params.require(:board).permit(:user_id, :name, :description)
    end
end
