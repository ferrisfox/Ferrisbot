require './commands/root_class.rb'

class Eval < Command
    def self.execute (event, args)
        super(event, args)
        raise Exception.new("Not Admin") unless YAML.load(File.open('Config.conf', 'r').read)['Admins'].include? event.user

        eval args.join(' ')
    end
end

class Status < Command
    def self.execute (event, args)
        super(event, args)
        raise Exception.new("Not Admin") unless YAML.load(File.open('Config.conf', 'r').read)['Admins'].include? event.user

        bot.update_status('online', args.join(' '), nil)
    end
end
