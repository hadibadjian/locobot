require 'app/commands/base'

module Locobot

  module Commands

    class Place < Base

      def exec(position)
        out_of_boundary?(params) ? position : params
      end

      private

        def validity_expression
          /^PLACE\s*\(\d*,\s*\d*,\s*[NORTH|SOUTH|EAST|WEST]*\)$/
        end

    end

  end

end
