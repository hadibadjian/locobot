module Locobot

  module Commands

    class Base

      FACES = { north: 'NORTH', east: 'EAST', south: 'SOUTH', west: 'WEST' }

      attr_accessor :command_str
      attr_accessor :operator
      attr_accessor :params

      def initialize(command_str)
        @command_str = command_str

        if valid?
          match_data = /(?<operator>[A-Z]+)\(?(?<params>(.*))\)?/.match(command_str)
          @operator  = match_data[:operator]
          args    = match_data[:params].gsub(/[\(\)]/, '').split(',').map(&:strip)

          @params = {}
          unless args.empty?
            @params[:x] = args[0].to_i
            @params[:y] = args[1].to_i
            @params[:face] = args[2]
          end
        end
      end

      def valid?
        validity_expression.match(@command_str).nil? ? false : true
      end

      def exec(position)
        return position if out_of_boundary?(position)
        position
      end

      def out_of_boundary?(result)
        result[:x] > 4 || result[:x] < 0 || result[:y] > 4 || result[:y] < 0
      end

      private

        def validity_expression
          raise 'has to be overwritten!'
        end

    end

  end

end
