module Locobot

  module Commands
    class Builder
      def self.build(command_str)
        operator = /(?<operator>[A-Z]+)\(*/.match(command_str)[:operator]
        command = Commands.const_get(operator.capitalize).new(command_str) if valid_operators.include?(operator)
        return (!command.nil? && command.valid?) ? command : nil
      end

      private
        def self.valid_operators
          @operators ||= ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT']
        end
    end

  end

end
