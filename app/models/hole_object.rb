class HoleObject < ActiveRecord::Base
  belongs_to :game
  belongs_to :room
end
