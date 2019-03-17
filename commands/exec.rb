require './command.rb'

# executes arguments as ruby code
class Exec < Command
  @description = nil

  def self.execute(event, args)
    super(event, args)
    raise Exception.new('DEV_MODE'), 'developer mode is too low' unless ENV['DEV_MODE'].to_i >= 2

    eval args.join(' ')
  end
end
