# frozen_string_literal: true
require 'discordrb'
require 'yaml'
require 'dotenv'
Dotenv.load('Key.env')

bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: '!'

puts "This bot's invite URL is: #{bot.invite_url}"


#load commands from external files

Dir["./commands/*.rb"].each {|file| require file }

YAML.load(File.open('commands.conf', 'r').read).keys.each do |cmd|
    bot.command(cmd.downcase.to_sym) do |event, *args|
        Object.const_get(cmd).execute(event, args)
    end
end


#define basic commands that don't need thier own file

bot.mention() do |event|
    break unless event.content.length <= 21
    event << "Hey #{event.user.mention} You can use !help for a list of what I can do"
end

bot.command(:ping, description: 'Check if I\'m online') do |event|
    event.message.react "👋"
end


#start the bot and perform startup activities

bot.run true

STARTUP = YAML.load(File.open('Config.conf', 'r').read)['Startup']

bot.update_status('online', STARTUP['Status'], nil)

YAML.load(File.open('Config.conf', 'r').read)['Admins'].each do |id|
    bot.send_temporary_message(bot.users[id].pm, STARTUP['Message'], STARTUP['Time'])
end

bot.join