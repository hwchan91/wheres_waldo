class ScoresController < ApplicationController
  def create
    if params[:score_id]
      update
    else
      @board = Board.find(params[:board_id])
      @score = @board.scores.new(player: params[:player], score: params[:score])
      if @score.save
        render json: { score_id: @score.id }
      else
        render json: { errors: @score.errors.full_messages }, :status => 422
      end
    end
  end

  def update
    @board = Board.find(params[:board_id])
    @score = Score.find(params[:score_id])
    if @score.update_attributes(player: params[:player])
      if params[:popup] == "true"
        popup
      else
        redirect_to boards_path
      end
    else
      render json: { errors: @score.errors.full_messages }, :status => 422
    end
  end


  def popup
    respond_to do |format|
      format.js {render :file => "boards/boardtable.js.erb"}
    end
  end

  def index
    @boards = Board.all
  end

#  private  --> for html form only
#    def score_params
#      params.require(:score).permit(:player, :score) #board_id, score provided
#    end
end
