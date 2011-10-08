class Message < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def parse_message
    message_value = "Incoming message not parsed correctly"
    message_type = "unknown"
    if self.text == ":new"
      message_type = "new"
    elsif self.text == ":help"
      message_type = "help"
    else # parse a command
      message_type = "command"
      message_value = self.text.downcase.split(' ').slice(0..2)
    end
    return {:type => message_type, :value => message_value }
  end
end
