require './scope.rb'

# superclass for all commands
class Command
  @description = nil
  def self.description
    @description
  end

  def self.all
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def self.execute(event, _args)
    raise Exception.new('Wrong Scope'), 'Blocked by scope' unless Scope.check(event, name) == 1
  end
end
