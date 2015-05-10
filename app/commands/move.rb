require 'commands/base'

module Locobot

  module Commands

    class Move < Base
      def valid?
        true
      end

      def exec(position)
        result = Array.new(position)
        case position[2]
        when 'NORTH'
          result[1] += 1
        when 'SOUTH'
          result[1] -= 1
        when 'EAST'
          result[0] += 1
        when 'WEST'
          result[0] -= 1
        end
        out_of_boundary?(result) ? position : result
      end
    end

  end

end
