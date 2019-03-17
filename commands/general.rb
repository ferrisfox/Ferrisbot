require './command.rb'

# check if bot is online
class Ping < Command
  @description = 'Check if I\'m online'
  @@all += [self]

  def self.execute(event, _args)
    event.message.react '👋'
  end
end

# get description of commands
class Help < Command
  @description = 'Display this list'
  @@all += [self]

  def self.execute(event, _args)
    @@all.each do |cmd|
      event << "`#{cmd.name.downcase}` #{cmd.description}" if cmd.description
    end
    nil
  end
end
