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
  attr_reader :discription
  @discription = nil

  @@all = []
  def self.all
    @@all
  end

  def self.execute(_event, _args)
    raise Exception.new('Command Dissabled'), 'Command is dissabled' unless @@all.include? self
  end
end
