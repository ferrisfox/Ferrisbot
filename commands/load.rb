require './command.rb'
require './loader'

# Reload code for commands
class Load < Command
  @description = 'Reload code for commands'

  def self.execute(_event, _args)
    super
    Loader.commands
    nil
  end
end
