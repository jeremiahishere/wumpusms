class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :room_id
      t.string :status
      t.integer :arrows

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
