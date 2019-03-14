require './command.rb'

# check if bot is online
class Ping < Command
  @discription = 'Check if I\'m online' 
  @@all += [self]

  def self.execute(event, _args)
    event.message.react '👋'
  end
end

# get discription of commands
class Help < Command
  @discription = 'Display this list'
  @@all += [self]

  def self.execute(event, _args)
    @@all.each do |cmd|
      event << "`#{cmd.name.downcase}` #{cmd.discription}" if cmd.discription
    end
    nil
  end
end
