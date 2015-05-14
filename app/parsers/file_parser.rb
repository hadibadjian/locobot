require 'commands'

module Locobot

  module Parser

    class FileParser

      attr_accessor :commands_count

      def read(file_path)
        @commands_list = []
        File.open(file_path, 'r') do |f|
          while line = f.gets
            command = Commands::Builder.build line.strip
            @commands_list << command unless command.nil?
          end
        end
        @commands_list.reverse!
        @commands_count = @commands_list.count
      end

      def next_command
        @commands_list.pop unless @commands_list.nil?
      end

    end

  end

end
