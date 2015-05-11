require 'commands/builder'
require 'commands/place'
require 'commands/move'
require 'commands/left'
require 'commands/right'
require 'commands/report'

module Locobot

  class Core

    attr_accessor :position
    attr_accessor :commands

    def commands=(input)
      parser = Locobot::Config.input_parser
      @commands = filter_commands(parser.parse(input)).reverse
    end

    def run(commands)
      command = commands.pop
      return if command.nil?
      @position = command.exec(Array.new(@position))
      run(commands)
    end

    def position
      @position ||= [-1, -1, "NORTH"]
    end

    private

      def filter_commands(commands)
        commands_list = []
        commands.split('->').map(&:strip).each do |command_str|
          command = Locobot::Commands::Builder.build command_str
          commands_list << command unless command.nil?
        end
        commands_list
      end

  end

end
