class CreateHoleObjects < ActiveRecord::Migration
  def self.up
    create_table :hole_objects do |t|
      t.integer :room_id
      t.integer :game_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hole_objects
  end
end
