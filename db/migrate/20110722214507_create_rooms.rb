class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.integer :game_id
      t.string :name
      t.integer :coord_x
      t.integer :coord_y

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
