require './commands/root_class.rb'

class RPS < Command
    def self.execute (event, args)
        bot_int = rand(3)
        event << "I chose #{['rock', 'paper', 'scissors'][bot_int]}!"
    
        player_int = {'rock' => 0, 'r' => 0, 'paper' => 1, 'p' => 1, 'scissors' => 2, 's' => 2}[args[0].to_s.downcase]
        if player_int == nil
            event << 'But I am unsure what option you chose'
            return 'Please chose Rock, Paper or Scissors! (or R, P or S)'
        end
    
        ['That\'s a draw!', 'I Win!', 'You win!'][(bot_int - player_int) % 3]
    end
end