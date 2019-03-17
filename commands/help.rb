require './command.rb'

# get description of commands
class Help < Command
  @description = 'Display this list'

  def self.execute(event, _args)
    @@all.each do |cmd|
      event << "`#{cmd.name.downcase}` #{cmd.description}" if cmd.description
    end
    nil
  end
end
