class AddProfileImageUrlToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :profile_image_url, :string
  end
end
