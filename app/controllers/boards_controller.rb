class BoardsController < ApplicationController
  def index
    @boards = Board.all
    @page = "root"
  end

  def show
    session.delete(:score_id)
    @board = Board.find(params[:id])
    @characters = @board.characters
    #session[:char_remaining] = @characters.map{&:name}
    #session[:start_time] = Time.now
  end

  def scores
    @board = Board.find(params[:id])
    @scores = @board.scores
  end

  def check_char
    response = false
    @board = Board.find(params[:board_id].to_i)
    @board.characters.each do |char|
      if (char.top - params[:top].to_i).abs <= 20 and (char.left - params[:left].to_i).abs <= 20
        response = {
          name: char.name
        }
      end
    end
    render json: response
  end


end
