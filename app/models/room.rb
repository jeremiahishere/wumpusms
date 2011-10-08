class Room < ActiveRecord::Base
  belongs_to :game
  has_many :players
  has_one :north, :foreign_key => 'north_of_room_id'
  has_one :south, :foreign_key => 'south_of_room_id'
  has_one :east, :foreign_key => 'east_of_room_id'
  has_one :west, :foreign_key => 'west_of_room_id'


  def north(room = nil)
    if room
      self.north_of_room_id = room.id
    else
      Room.find_by_id(self.north_of_room_id)
    end
  end

  def east(room = nil)
    if room
      self.east_of_room_id = room.id
    else
      Room.find_by_id(self.east_of_room_id)
    end
  end

  def south(room = nil)
    if room
      self.south_of_room_id = room.id
    else
      Room.find_by_id(self.south_of_room_id)
    end
  end

  def west(room = nil)
    if room
      self.west_of_room_id = room.id
    else
      Room.find_by_id(self.west_of_room_id)
    end
  end

  def self.find_by_game_and_coordinates(coords, game)
    Room.where(:coord_x => coords[:x], :coord_y => coords[:y], :game_id => game.id)
  end

  def self.find_by_coordinates(coords)
    Room.where(:coord_x => coords[:x], :coord_y => coords[:y])
  end

  def make_two_way_connection(direction, board_size)
    x = self.coord_x
    y = self.coord_y
    coords = {}
    if direction == :north
      coords = Room.bounded_coordinates(x, y-1, board_size)
    elsif direction == :east
      coords = Room.bounded_coordinates(x+1, y, board_size)
    elsif direction == :south
      coords = Room.bounded_coordinates(x, y+1, board_size)
    elsif direction == :west
      coords = Room.bounded_coordinates(x-1, y, board_size)
    end
    adjacent_room = Room.find_by_game_and_coordinates(coords,game).first
    if !adjacent_room.nil?
      # refactor?
      self.send(direction, adjacent_room)
      self.save
      if adjacent_room.send(opposite_room_connection(direction)).nil?
        adjacent_room.send(opposite_room_connection(direction), self)
        adjacent_room.save
      end
      puts self.inspect
      puts adjacent_room.inspect
      puts "==================================="
    else
      puts "did not find an adjacent room for #{coord_x}, #{coord_y} in direction #{direction}"
    end
    
  end

  def opposite_room_connection(direction)
    if direction == :north
      :south
    elsif direction == :east
      :west
    elsif direction == :south
      :north
    elsif direction == :west
      :east
    end
  end

  def self.bounded_coordinates(x, y, board_size)
    puts "input coordinates: #{x}, #{y}"
    while x >= board_size
      x -= board_size
    end

    while x < 0
      x += board_size
    end

    while y >= board_size
      y -= board_size
    end

    while y < 0
      y += board_size
    end
    puts "bounded coordinates: #{x}, #{y}"
    return {:x => x, :y => y }
  end

  def coordinates
    {:x => self.coord_x, :y => self.coord_y }
  end

  def adjacent_to? other_room
    [ north_of_room_id, south_of_room_id, east_of_room_id, west_of_room_id ].include? other_room.id
  end
end
