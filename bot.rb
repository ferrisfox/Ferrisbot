# frozen_string_literal: true

require 'discordrb'
require 'yaml'
require 'dotenv/load'

# create CommandBot; hide token; display invite_url
@bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: '!', help_command: false
ENV['BOT_TOKEN'] = nil
puts "This bot's invite URL is: #{@bot.invite_url}"

# load commands from external files
def load_commands
  load './command.rb'
  Dir['./commands/*.rb'].each { |file| load file }
  Command.all.each do |cmd|
    @bot.command(cmd.name.downcase.to_sym) do |event, *args|
      cmd.execute(event, args)
    end
  end
end

load_commands

# allow developers to reload command files when enabled
if ENV['DEV_MODE'].to_i >= 1
  @bot.command(:load) do |event|
    break unless YAML.safe_load(File.open('Config.conf', 'r').read)['Admins'].include? event.user

    load_commands
  end
end

if ENV['DEV_MODE'].to_i >= 3
  @bot.command(:EVAL) do |event, *args|
    break unless YAML.safe_load(File.open('Config.conf', 'r').read)['Admins'].include? event.user

    eval args.join(' ')
  end
end

# respond to @mention with help infomation
@bot.mention do |event|
  break unless event.content.length <= 21

  event << "Hey #{event.user.mention} You can use !help for a list of what I can do"
end

# start the bot and perform startup activities

@bot.run true

STARTUP = YAML.safe_load(File.open('Config.conf', 'r').read)['Startup']

@bot.update_status('online', STARTUP['Status'], nil)

YAML.safe_load(File.open('Config.conf', 'r').read)['Admins'].each do |id|
  @bot.send_temporary_message(@bot.users[id].pm, STARTUP['Message'], STARTUP['Time'])
end

@bot.join
