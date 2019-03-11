require './commands/root_class.rb'

class Roll < Command
    def self.execute (event, args)
        super(event, args)

        sides = 6 unless (sides = args[0].to_i) >= 1
        return "Rolled a #{(rand(sides) + 1).to_s}."
    end
end

class Coin < Command
    def self.execute (event, args)
        super(event, args)
        return "Landed on #{['heads', 'tails'][rand(2)]}."
    end
end