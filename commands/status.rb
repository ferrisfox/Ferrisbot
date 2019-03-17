require './command.rb'

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
