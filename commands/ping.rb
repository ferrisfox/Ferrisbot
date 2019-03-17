require './command.rb'

# check if bot is online
class Ping < Command
  @description = 'Check if I\'m online'

  def self.execute(event, _args)
    event.message.react '👋'
  end
end
