require './command.rb'
require './loader'

# Reload code for commands
class Load < Command
  @description = 'Reload code for commands'

  def self.execute(_event, _args)
    return unless ENV['DEV_MODE'].to_i >= 1

    super
    Loader.commands
    nil
  end
end
