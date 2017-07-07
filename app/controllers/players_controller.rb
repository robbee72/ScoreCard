class PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @player = Player.order("#{sort_column} #{sort_direction}")
  end

  def new
    @player = Player.new
  end

  def create
    #render plain: params[:player].inspect
    @player = Player.new(player_params)
    if @player.save
      flash[:notice] = "Player was successfully added"
      redirect_to players_path(@player)
    else
      render 'new'
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      flash[:notice] = "Player was successfully updated"
      redirect_to player_path(@player)
    else
      render 'edit'
    end
  end

  private
  def player_params
    params.require(:player).permit(:name, :ranking)
  end

  def sortable_columns
    ["name", "ranking"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "ranking"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
