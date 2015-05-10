module Locobot

  module Commands

    class Base
      attr_accessor :command_str
      attr_accessor :operator
      attr_accessor :params

      def initialize(command_str)
        @command_str = command_str

        if valid?
          match_data = /(?<operator>[A-Z]+)\(?(?<params>(.*))\)?/.match(command_str)
          @operator  = match_data[:operator]
          @params    = match_data[:params].gsub(/[\(\)]/, '').split(',').map(&:strip)
          @params[0] = params[0].to_i
          @params[1] = params[1].to_i
        end
      end

      def valid?
        raise 'Subclasses should overwrite this'
      end

      def out_of_boundary?(result)
        result[0] > 4 || result[0] < 0 || result[1] > 4 || result[1] < 0
      end

      def to_s
        "#{@operator}" + "#{params}"
      end
    end

  end

end
