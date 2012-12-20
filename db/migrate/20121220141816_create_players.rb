class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :club
      
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.datetime :born_at
      t.boolean :gender, default: true
      
      t.string :position
      t.integer :number
      
      t.integer :acceleration
      t.integer :stamina
      t.integer :aggression
      t.integer :marking
      t.integer :balance

      t.timestamps
    end
    
    add_index :players, :club_id
    add_index :players, :last_name
    add_index :players, :number
  end
end
