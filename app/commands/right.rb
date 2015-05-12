require 'app/commands/base'

module Locobot

  module Commands

    class Right < Base

      def exec(position)
        super
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

      private

        def validity_expression
          /^RIGHT$/
        end

    end

  end

end
