class AddClubImageUrlToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :club_image_url, :string
  end
end
