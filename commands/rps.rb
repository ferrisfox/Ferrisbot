require './command.rb'

# plays rock, paper, scissors
class RPS < Command
  @description = 'Play Rock Paper Scissors'
  @@all += [self]

  def self.execute(event, args)
    bot_int = rand(3)
    event << "I chose #{%w[rock paper scissors][bot_int]}!"

    choice_ints = { 'rock': 0, 'r': 0, 'paper': 1, 'p': 1, 'scissors': 2, 's': 2 }
    player_int = choice_ints[args[0].to_s.downcase.to_sym]
    if player_int.nil?
      event << 'But I am unsure what option you chose'
      return 'Please chose Rock, Paper or Scissors! (or R, P or S)'
    end

    ['That\'s a draw!', 'I Win!', 'You win!'][(bot_int - player_int) % 3]
  end
end
