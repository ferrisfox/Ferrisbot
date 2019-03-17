require './command.rb'

# check if bot is online
class Ping < Command
  @description = 'Check if I\'m online'
  @@all += [self]

  def self.execute(event, _args)
    event.message.react '👋'
  end
end