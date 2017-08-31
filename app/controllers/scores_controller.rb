class ScoresController < ApplicationController
  def create
    @page = params[:link_to]
    @board = Board.find(params[:board_id].to_i)
    existing_score = @board.scores.find_by(player: params[:player], score: params[:score])
    if existing_score
      update(existing_score)
    else
      @score = @board.scores.new(player: params[:player], score: params[:score])
      redirect(@score.save)
    end
  end

  def update(existing_score)
    redirect(existing_score.update_attributes(player: params[:player]))
  end

  def redirect(condition)
    if condition
      if @page == "scoreboard" or @page == "submit_name"
        popup
      else
        render js: "window.location.pathname='#{boards_path}'"
      end
    else
      render :json => { :errors => @score.errors.full_messages }, :status => 422
    end
  end

  def popup
#    @board = Board.find(params[:board_id].to_i)
#    @page = params[:link_to]
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
