require 'commands'

module Locobot

  class Core

    attr_accessor :position

    def run
      while command = Config.input_parser.next_command
        @position = command.exec(@position)
      end
    end

    def position
      @position ||= [x: -1, y: -1, face: 'NORTH']
    end

  end

end
