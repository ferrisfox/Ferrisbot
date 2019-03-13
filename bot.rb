# frozen_string_literal: true

require 'discordrb'
require 'yaml'
require 'dotenv'
Dotenv.load('Key.env')

@bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: '!', help_command: false

puts "This bot's invite URL is: #{@bot.invite_url}"

#
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

#
# define basic commands that don't need thier own file

@bot.mention do |event|
  break unless event.content.length <= 21

  event << "Hey #{event.user.mention} You can use !help for a list of what I can do"
end

@bot.command(:ping, description: 'Check if I\'m online') do |event|
  event.message.react '👋'
end

@bot.command(:load) do |event|
  break unless YAML.safe_load(File.open('Config.conf', 'r').read)['Admins'].include? event.user

  load_commands
end

#
# start the bot and perform startup activities

@bot.run true

STARTUP = YAML.safe_load(File.open('Config.conf', 'r').read)['Startup']

@bot.update_status('online', STARTUP['Status'], nil)

YAML.safe_load(File.open('Config.conf', 'r').read)['Admins'].each do |id|
  @bot.send_temporary_message(@bot.users[id].pm, STARTUP['Message'], STARTUP['Time'])
end

@bot.join
