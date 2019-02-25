# frozen_string_literal: true
require 'discordrb'


bot = Discordrb::Bot.new token: ENV['BOT_TOKEN']

bot.message(content: '@Ferrisbot#1235 ') do |event|
    event << 'Hey @' + event.user.name + ' You can use !help for a list of what I can do'
  end