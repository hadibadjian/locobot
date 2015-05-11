require 'commands/base'

module Locobot

  module Commands

    class Left < Base

      def exec(position)
        super
        case position[2]
        when 'NORTH'
          position[2] = 'WEST'
        when 'SOUTH'
          position[2] = 'EAST'
        when 'EAST'
          position[2] = 'NORTH'
        when 'WEST'
          position[2] = 'SOUTH'
        end
        position
      end

      private

        def validity_expression
          /^LEFT$/
        end

    end

  end

end
