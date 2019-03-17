require './scope.rb'

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

  def self.execute(event, _args)
    raise Exception.new('Command Dissabled'), 'Command is dissabled' unless @@all.include? self

    raise Exception.new('Wrong Scope'), 'Blocked by scope' unless Scope.check(event, name) == 1
  end
end
