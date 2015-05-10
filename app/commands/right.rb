require 'commands/base'

module Locobot

  module Commands

    class Right < Base
      def valid?
        true
      end

      def exec(position)
        case position[2]
        when 'NORTH'
          position[2] = 'EAST'
        when 'SOUTH'
          position[2] = 'WEST'
        when 'EAST'
          position[2] = 'SOUTH'
        when 'WEST'
          position[2] = 'NORTH'
        end
        position
      end
    end

  end

end
