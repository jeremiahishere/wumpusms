class Game < ActiveRecord::Base
  has_many :game_users, :class_name => "GameUser"
  has_many :users, :through => :game_users

  has_many :players
  has_many :rooms
  has_many :golds, :class_name => "GoldObject"
  has_many :holes, :class_name => "HoleObject"
  has_one :wumpus, :class_name => "WumpusObject"

  after_create :create_board

  def create_board
    board_size = 5 

    # create rooms
    (0..board_size).each do |x|
      (0..board_size).each do |y|
        room = Room.create(:game => self, :name => "Room", :coord_x => x, :coord_y => y)
        puts "************************ room start *****************************"
        room.make_two_way_connection(:north, board_size)
        room.make_two_way_connection(:east, board_size)
        room.make_two_way_connection(:south, board_size)
        room.make_two_way_connection(:west, board_size)
        puts "************************** room complete **************************"
      end
    end
    # create wumpus
    x = rand(board_size)
    y = rand(board_size)
    room = Room.find_by_coordinates({:x => x, :y => y}).where(:game_id => self.id).first
    wumpus = WumpusObject.create(:game => self, :room => room, :status => "alive")
    puts "wumpus: " + room.coordinates.to_s

    # create gold
    x = rand(board_size)
    y = rand(board_size)
    gold_value = rand(100)
    room = Room.find_by_coordinates({:x => x, :y => y}).where(:game_id => self.id).first
    gold = GoldObject.create(:game => self, :room => room, :amount => gold_value)
    puts "gold: " + room.coordinates.to_s

    # create holes
    (0..1).each do |h|
      x = rand(board_size)
      y = rand(board_size)
      room = Room.find_by_coordinates({:x => x, :y => y}).where(:game_id => self.id).first
      hole = HoleObject.create(:game => self, :room => room)
      puts "hole: " + room.coordinates.to_s
    end

    x = 0
    y = 0
    room = Room.find_by_coordinates({:x => x, :y => y}).where(:game_id => self.id).first
    player = Player.create(:game => self, :room => room, :status => "alive", :arrows => 3, :money => 0)
    puts "player: " + room.coordinates.to_s

  end

  def process_command(command, argument)
    partial_message = ""
    player = players.first

    if player.status == "dead"
      partial_message += "You are dead and cannot take any more actions;"
    elsif player.status == "alive"
      if command == "move"
        if player.room.send(argument).nil?
          partial_message = "You just ran into a wall, dummy"
        else
          player.room = player.room.send(argument)
          player.save
          partial_message = "You have moved to #{player.room.coord_x}, #{player.room.coord_y};"
        end

      elsif command == "shoot"
        if player.arrows < 1
          partial_message = "You are out of arrows"
        else
          shoot_room = nil
          if player.room.send(argument).nil?
            partial_message += "You just shot a wall, dummy"
          else
            shoot_room = player.room.send(argument)
          end

          if wumpus.room == shoot_room
            wumpus.status = "dead"
            wumpus.save
            partial_message += "The wumpus screams.  It is dead. Fin."
          end
          #if wumpus.room.adjacent_to?(shoot_room)
          #  wumpus.move_one_space_in_random_direction
          #end
        end
      elsif command == "grab"
        if argument == "gold"
          self.golds.each do |gold|
            if player.room = gold.room
              puts player.money
              puts gold.amount
              player.money += gold.amount
              gold.destroy
              player.save
              partial_message += "You now have #{player.money} gold;"
            end
          end
        elsif argument == "arrow"
        end
      end
    end

    if player.room == wumpus.room
      player.status = "dead"
      player.save
    end

    holes.each do |hole|
      if player.room == hole.room
        player.status = "dead"
        player.save
      end
    end
    
    return get_player_message(player, partial_message)
  end

  def get_player_message(player, partial_message)
    message = partial_message || ""
    puts message
    if player.room.adjacent_to?(wumpus.room) && wumpus.status == "alive"
      message += "Stench perceived;"
    end

    holes.each do |hole|
      if player.room.adjacent_to?(hole.room)
        message += "Breeze perceived;"
      end
    end

    golds.each do |gold|
      if player.room.adjacent_to?(gold.room)
        message += "Glitter percevied;"
      end
    end

    if player.room == wumpus.room && wumpus.status == "alive"
      message += "You have been eaten by the wumpus"
    end

    holes.each do |hole|
      if player.room == hole.room
        message += "You have fallen down a hole"
      end
    end
    
    golds.each do |gold|
      if player.room == gold.room
        message += "You see some gold;"
      end
    end

    return message
  end
end
