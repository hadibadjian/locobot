require 'app/commands/base'

module Locobot

  module Commands

    class Move < Base

      def exec(position)
        super
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

      private

        def validity_expression
          /^MOVE$/
        end

    end

  end

end
