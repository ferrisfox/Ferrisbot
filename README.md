# discord-ferrisbot

A Discord bot developed with the [discordrb](https://github.com/meew0/discordrb) Gem for Ruby.

## Execution

### With Huroku

Once bot is running on Huroku, the bot token needs to be specified with the config variable:

    BOT_TOKEN

(restart requiered)

>TODO: explain admin codeing (ommited untill admin system is finalised)

### Localy

replace code on line 4:

    bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: '!'

with:

    bot = Discordrb::Commands::CommandBot.new token: 'B0T.T0KEN.here', prefix: '!'

where 'B0T.T0KEN.here' is the bot token obtained through the [Discord Developer Portal](https://discordapp.com/developers)
**Pushing code that contains the bot token to a public repository is ill advised as it allows other developers to missuse your bot and your name**

then run:

    [bundler](https://bundler.io/#getting-started) exec ruby bot.rb

## Features

### Public Commands

List commands:
    !help

Check if bot is online: (will recive reaction)
    !ping

Roll an dice of any amount of sides:
    !roll [n]

Flip a coin:
    !flip

### Other Public Features

when mentioned, will prompt user to use !help command.

### Developer Commands

Execute code:
    !eval <code to run>

Change bot status:
    !status <'new status'>

### Other Developer Features

sends a pm to all bot admins when code starts

console log displays invite link
