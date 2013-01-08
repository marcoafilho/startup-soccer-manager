class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :host
      t.belongs_to :guest
      t.integer :host_score
      t.integer :guest_score
      t.string :location
      t.datetime :played_at

      t.timestamps
    end

    add_index :matches, :host_id
    add_index :matches, :guest_id
  end
end
