require 'lib/string'

module Locobot

  module Parser

    class JSONParser

      attr_accessor :commands_count

      COMMANDS_KEY = "commands"

      def read(input)
        raw_commands = parse input
        @commands_list = translate(raw_commands).reverse
        @commands_count = @commands_list.count
      end

      def next_command
        @commands_list.pop unless @commands_list.nil?
      end

      private

        def parse(input)
          json_input = JSON.parse(input)
          raise 'the input should contain \'commands\' key!' if json_input[COMMANDS_KEY].blank?
          json_input[COMMANDS_KEY]
        end

        def translate(commands)
          commands_list = []
          commands.split(Config.command_separator).map(&:strip).each do |command_str|
            command = Commands::Builder.build command_str
            commands_list << command unless command.nil?
          end
          commands_list
        end

    end

  end

end
