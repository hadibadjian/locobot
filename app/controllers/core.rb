require 'app/commands.rb'

module Locobot

  class Core

    attr_accessor :position

    def run
      while command = Config.input_parser.next_command
        @position = command.exec(@position)
      end
    end

    def position
      @position ||= [-1, -1, "NORTH"]
    end

  end

end
