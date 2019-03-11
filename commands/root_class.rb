require 'yaml'

class CommandMeta
    attr_accessor :enabled, :help_available, :discription

    def initialize ()
        @enabled = false
        @help_available = false
        @discription = ''
    end
end

class Command
    def self.execute (event, args)
        abort unless (YAML.load(File.open('commands.conf', 'r').read)[self.name] || CommandMeta.new).enabled
    end

#        abort unless self.enabled?()
#    end
#
#    def self.enabled? ()
#        meta().enabled
#    end
#
#    def meta ()
#        return YAML.load(File.open('commands.conf', 'r').read)[self.class.name] || CommandMeta.new
#    end
end
