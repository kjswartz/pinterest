class BoardsController < InheritedResources::Base
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @boards = @user.boards
  end

  def new
    @user = User.find(params[:user_id])
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
      @user = User.find(params[:user_id])
      @board = @user.boards.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:user_id, :name, :description)
    end
end
