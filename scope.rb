require 'yaml'

# used for checking wether or not a command should be run given any context
class Scope
  def self.check(event, command_name)
    scope_command(YAML.safe_load(File.open('scope.conf', 'r').read), event, command_name)
  end

  def self.scope_command(scope, event, command_name)
    scope_channel(scope[command_name.downcase], event) || scope_channel(scope['default'], event)
  end

  def self.scope_channel(scope, event)
    return nil if scope.nil?

    channel_selector = { 1 => 'pm', 3 => 'group' }[event.channel.type] || event.channel.id
    scope_user(scope[channel_selector], event) || scope_user(scope['default'], event)
  end

  def self.scope_user(scope, event)
    return nil if scope.nil?

    admins = YAML.safe_load(File.open('Config.conf', 'r').read)['Admins']
    admin_scope = scope['admin'] if admins.include? event.user.id
    scope[event.user.id] || admin_scope || scope['default']
  end
end
