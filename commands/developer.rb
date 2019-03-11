require './commands/root_class.rb'

# executes arguments as ruby code
class Eval < Command
  def self.execute (event, args)
    super(event, args)
    admins = YAML.safe_load(File.open('Config.conf', 'r').read)['Admins']
    raise Exception.new('Not Admin'), 'user is not admin' unless
      admins.include? event.user

    eval args.join(' ')
  end
end

# changes bot playing message
class Status < Command
  def self.execute (event, args)
    super(event, args)
    admins = YAML.safe_load(File.open('Config.conf', 'r').read)['Admins']
    raise Exception.new('Not Admin'), 'user is not admin' unless
      admins.include? event.user

    bot.update_status('online', args.join(' '), nil) # turnsout we don't have access to bot here, fix needed
  end
end
