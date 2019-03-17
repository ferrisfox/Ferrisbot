require './command.rb'

# flips a coin
class Coin < Command
  @description = 'Flip a coin'
  @@all += [self]

  def self.execute(event, args)
    super
    "Landed on #{%w[heads tails][rand(2)]}."
  end
end
