class PlayersController < ApplicationController

  def index
    @player = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:notice] = "Player was successfully added"
    redirect_to player_path(@player)
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
    params.require(:player).permit(ranking)
  end
end
