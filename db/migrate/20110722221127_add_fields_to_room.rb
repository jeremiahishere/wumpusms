class AddFieldsToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :north_of_room_id, :integer
    add_column :rooms, :south_of_room_id, :integer
    add_column :rooms, :east_of_room_id, :integer
    add_column :rooms, :west_of_room_id, :integer
  end

  def self.down
    remove_column :rooms, :west_of_room_id
    remove_column :rooms, :east_of_room_id
    remove_column :rooms, :south_of_room_id
    remove_column :rooms, :north_of_room_id
  end
end
