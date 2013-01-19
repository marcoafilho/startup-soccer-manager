class MatchesController < ApplicationController
  respond_to :html, :json
  
  def index
    @matches = Match.order("played_at DESC")
    
    respond_with @matches
  end
  
  def show
    @match = Match.find(params[:id])
    
    respond_with @match
  end
  
  def new
    @match = Match.new
    
    respond_with @match
  end
  
  def create
    @match = Match.new(params[:match])
    
    if @match.save
      respond_with @match
    end
  end
  
  def edit
    @match = Match.find(params[:id])
  end
  
  def update
    @match = Match.find(params[:id])
    
    if @match.update_attributes(params[:match])
      respond_with @match
    end
  end
  
  def destroy
    @match = Match.find(params[:id])
    @match.destroy
  end
end
