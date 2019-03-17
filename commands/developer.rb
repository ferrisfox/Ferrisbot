require './command.rb'

# executes arguments as ruby code
class Eval < Command
  @description = nil
  if ENV['DEV_MODE'] >= 2
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

# changes bot playing message
class Status < Command
  @description = nil
  @@all += []

  def self.execute(event, args)
    super(event, args)
    admins = YAML.safe_load(File.open('Config.conf', 'r').read)['Admins']
    raise Exception.new('Not Admin'), 'user is not admin' unless
      admins.include? event.user

    # turnsout we don't have access to bot here, fix needed
    bot.update_status('online', args.join(' '), nil)
  end
end
