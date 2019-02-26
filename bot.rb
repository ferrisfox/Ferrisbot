# frozen_string_literal: true
require 'discordrb'
require 'yaml'

bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: '!'

puts "This bot's invite URL is: #{bot.invite_url}"



BOT_ADMINS = YAML.load(File.open('Config.conf', 'r').read)['Admins']

def is_admin (user)
    #user = user.user unless user.respond_to?(:pm)  #tries to fix any cases of bad input. just give propper input insted.
    return BOT_ADMINS.include? user
end




bot.command(:eval, help_available: false) do |event, *args|
    break unless is_admin(event.user)

    eval args.join(' ')
end

bot.command(:status, help_available: false) do |event, *args|
    break unless is_admin(event.user)

    bot.update_status('online', args.join(' '), nil)
end




bot.mention() do |event|
    break unless event.content.length <= 21
    event << 'Hey ' + event.user.mention + ' You can use !help for a list of what I can do'
end


bot.command(:ping, description: 'Check if I\'m online') do |event|
    event.message.react "👋"
end

bot.command(:roll, description: 'Roll a dice') do |_event, sides|
    sides = 6 unless sides.to_i >= 1
    return 'Rolled a ' + (rand(sides.to_i) + 1).to_s + '.'
end

bot.command(:coin, description: 'Flip a coin') do |_event|
    return 'Landed on ' + ['heads', 'tails'][rand(2)] + '.'
end

bot.command(:rps) do |event, player_choice|
    bot_int = rand(3)
    event << 'I chose' + ['rock', 'paper', 'scissors'][bot_int] + '!'

    case player_choice.to_s.downcase
    when 'rock', 'r'
        player_int = 0
    when 'paper', 'p'
        player_int = 1
    when 'scissors', 's'
        player_int = 2
    else
        event << 'But I am unsure what option you chose'
        event << 'Please chose Rock, Paper or Scissors! (or R, P or S)'
        return nil
    end

    case ((bot_int + player_int) % 3)
    when 1
        event << '1'
    when 2
        event << '2'
    else 
        event << '3'
    end
end




bot.run true

bot.update_status('online', 'say !help for commands', nil)
for user in BOT_ADMINS
    bot.send_temporary_message(bot.users[user].pm, 'I\'m online. beep boop.', 10)
end

bot.join