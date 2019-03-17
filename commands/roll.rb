require './command.rb'

# roll a dice
class Roll < Command
  @description = 'Roll a dice'
  @@all += [self]

  def self.execute(event, args)
    super(event, args)

    sides = 6 unless (sides = args[0].to_i) >= 1
    "Rolled a #{(rand(sides) + 1)}."
  end
end