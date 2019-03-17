# discord-ferrisbot

A Discord bot developed with the [discordrb](https://github.com/meew0/discordrb) Gem for Ruby.

## Setup

replace Admin user id(s) in config.conf

## Execution

### With Huroku

Once bot is running on Huroku, the bot token needs to be specified with the config variable:

    BOT_TOKEN

(Restart requiered)

### Localy without Heroku CLI

create a file named .env and place it in the root directory of the project.
set the contents to be as follows:

    BOT_TOKEN = 'B0T.T0KEN.here'

where 'B0T.T0KEN.here' is the bot token obtained through the [Discord Developer Portal](https://discordapp.com/developers).
do not uplaod this file to any public repository to prevent missuse of your bot token.

then run:

    bundle exec ruby bot.rb

or see [discordrb installation](https://github.com/meew0/discordrb#installation) and run:

    bot.rb

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

Play Rock Paper scissors:

    !rps <choice>

### Other Public Features

when mentioned, will prompt user to use !help command.

### Developer Commands

Execute code:

    !eval <code to run>

Change bot status:

    !status <'new status'>

### Other Developer Features

sends a pm to all bot admins when code starts.

console log displays invite link.

config file allows for the adminto enable and diable the bot without restart.
also allows for modification to help text for commands.