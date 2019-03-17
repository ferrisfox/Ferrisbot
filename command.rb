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
