# loads assets into memory
class Loader
  def self.bot=(bot)
    @bot = bot
  end

  def self.commands
    load './command.rb'
    Dir['./commands/*.rb'].each { |file| load file }
    Command.all.each do |cmd|
      @bot.command(cmd.name.downcase.to_sym) do |event, *args|
        cmd.execute(event, args)
      end
    end
  end
end
