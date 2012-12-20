class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name, null: false
      t.date :founded_at

      t.timestamps
    end
    
    add_index :clubs, :name, unique: true
  end
end
