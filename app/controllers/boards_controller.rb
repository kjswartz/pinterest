class BoardsController < InheritedResources::Base
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @boards = @user.boards
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def show
  end

  def create
    @board = @users.boards.create(board_params)
    redirect_to user_path(@user)
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
    end
  end
  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:user_id, :name, :description)
    end
end
