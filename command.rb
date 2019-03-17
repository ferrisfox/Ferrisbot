# serialized for configerable command settings
class CommandMeta
  attr_accessor :enabled, :help_available, :description

  def initialize
    @enabled = false
    @help_available = false
    @description = ''
  end
end

# superclass for all commands
class Command
  @description = nil
  def self.description
    @description
  end

  @@all = []
  def self.all
    @@all
  end

  def self.execute(_event, _args)
    raise Exception.new('Command Dissabled'), 'Command is dissabled' unless @@all.include? self
  end
end
