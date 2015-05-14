require 'commands/base'

module Locobot

  module Commands

    class Move < Base

      def exec(position)
        super
        result = position.clone

        transform = transform_map[position[:face].downcase.to_sym]
        result[transform[:key]] += transform[:operand]

        out_of_boundary?(result) ? position : result
      end

      private

        def validity_expression
          /^MOVE$/
        end

        def transform_map
          @transform_map ||= {
            north: { key: :y, operand:  1 },
            south: { key: :y, operand: -1 },
            east:  { key: :x, operand:  1 },
            west:  { key: :x, operand: -1 }
          }
        end

    end

  end

end
