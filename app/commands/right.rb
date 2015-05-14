require 'commands/base'
require 'hash'

module Locobot

  module Commands

    class Right < Base

      def exec(position)
        super
        position[:face] = FACES.side_element position[:face].downcase.to_sym, 1
        position
      end

      private

        def validity_expression
          /^RIGHT$/
        end

    end

  end

end
