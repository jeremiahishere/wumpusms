class CreateRoomConnections < ActiveRecord::Migration
  def self.up
    create_table :room_connections do |t|
      t.integer :start_room_id
      t.integer :end_room_id

      t.timestamps
    end
  end

  def self.down
    drop_table :room_connections
  end
end
