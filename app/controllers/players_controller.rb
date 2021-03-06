class PlayersController < ApplicationController
  respond_to :html, :json
  
  def index
    @players = Player.order(:last_name)
    
    respond_with @players
  end
  
  def show
    @player = Player.find(params[:id])
    
    respond_with @player
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
    
    @player.update_attribute :club_id, params[:player][:club_id]
    if @player.update_attributes params[:player]
      respond_with @player
    end
  end
  
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
  end
end
