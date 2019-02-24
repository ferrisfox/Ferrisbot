# frozen_string_literal: true
require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MjIxMTY1ODMwOTg4MjM0NzUy.Dz_wVA.tI-P1AbgkiF7nrAAUS37vB9923Y', prefix: '!'

puts "This bot's invite URL is: #{bot.invite_url}"


bot.command(:eval, help_available: false) do |event, *args|
    break unless event.user.id == 109792060256616448

    eval args.join(' ')
end

bot.command(:status, help_available: false) do |event, *args|
    break unless event.user.id == 109792060256616448

    bot.update_status('online', args.join(' '), nil)
end


bot.command(:ping, discription: '') do |event|
    event.react '\u1f44b'
end

bot.command(:roll) do |_event, sides|
    sides = 6 unless sides.to_i >= 1
    return 'Rolled a ' + rand(sides.to_i) + '.'
end

bot.command(:coin) do |_event|
    return 'Landed on ' + ['heads', 'tails'][rand(2)] + '.'
end

bot.run