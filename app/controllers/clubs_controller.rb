class ClubsController < ApplicationController
  respond_to :html, :json
  
  def index
    @clubs = Club.all
    
    respond_with @clubs
  end
  
  def show
    @club = Club.find(params[:id])
    
    respond_with @club
  end
  
  def new
    @club = Club.new
    
    respond_with @club
  end
end
