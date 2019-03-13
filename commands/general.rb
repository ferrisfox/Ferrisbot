require './command.rb'

# check if bot is online
class Ping < Command
  @@all += [self]

  def self.execute(event, _args)
    event.message.react '👋'
  end
end

# get discription of commands
class Help < Command
  @@all += [self]

  def self.execute(event, _args)
    YAML.load(File.open('commands.conf', 'r').read).each do |key, value|
      event << "`#{key}` #{value.discription}" if value.help_available
    end
    return nil
  end
end
