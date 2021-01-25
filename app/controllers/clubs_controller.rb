class ClubsController < ApplicationController
  respond_to :html, :json

  def index
    @clubs = Club.where("name = #{params[:name]}")

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



  def create
    @club = Club.new(params[:club])

    if @club.save
      respond_with @club, status: :created
    end
  end

  def edit
    @club = Club.find(params[:id])

    respond_with @club
  end

  def update
    @club = Club.find(params[:id])

    if @club.update_attributes params[:club]
      respond_with @club
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy

    respond_with @club
  end

  private

  def club_params
    params.require(:club).permit(:id, :name)
  end
end
