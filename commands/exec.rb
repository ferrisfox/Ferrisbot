require './command.rb'

# executes arguments as ruby code
class Exec < Command
  @description = nil
  if ENV['DEV_MODE'].to_i >= 2
    @@all += [self]
  end

  def self.execute(event, args)
    super(event, args)
    raise Exception.new('low DEV_MODE'), 'developer mode is too low' unless ENV['DEV_MODE'] >= 2

    admins = YAML.safe_load(File.open('Config.conf', 'r').read)['Admins']
    raise Exception.new('Not Admin'), 'user is not admin' unless admins.include? event.user

    eval args.join(' ')
  end
end