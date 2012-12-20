class PlayersController < ApplicationController
  respond_to :html, :json
  
  def index
    @players = Player.all
    
    respond_with @players
  end
  
  def show
    
  end
  
  def new
    @player = Player.new()
    
    respond_with @player
  end
  
  def create
    @player = Player.new(params[:player])
    
    if @player.save
      respond_with @player
    end
  end
  
  def edit
    @player = Player.find(params[:id])
  end
  
  def update
    @player = Player.find(params[:id])
    
    if @player.update_attributes params[:player]
      respond_with @player
    end
  end
  
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
  end
end
