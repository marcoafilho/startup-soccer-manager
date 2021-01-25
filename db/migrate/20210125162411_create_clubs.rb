class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.date :founded_at
      t.string :club_image_url

      t.timestamps
    end
    add_index :clubs, :name
  end
end
