require 'app/commands/base'
require 'lib/hash'

module Locobot

  module Commands

    class Left < Base

      def exec(position)
        super
        position[:face] = FACES.side_element position[:face].downcase.to_sym, -1
        position
      end

      private

        def validity_expression
          /^LEFT$/
        end

    end

  end

end
