require 'yaml'

# serialized for configerable command settings
class CommandMeta
  attr_accessor :enabled, :help_available, :discription

  def initialize
    @enabled = false
    @help_available = false
    @discription = ''
  end
end

# superclass for all commands
class Command
  def self.execute(_event, _args)
    meta = (YAML.load(File.open('commands.conf', 'r').read)[name] || CommandMeta.new)
    raise Exception.new('Command Dissabled'), 'Command is dissabled' unless
      meta.enabled
  end
end
