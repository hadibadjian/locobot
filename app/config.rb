module Locobot

  class Config

    include Singleton

    attr_accessor :input_parser
    attr_accessor :command_separator

    def self.input_parser
      instance.input_parser
    end

    def self.input_parser=(input_parser)
      instance.input_parser = input_parser
    end

    def self.command_separator
      instance.command_separator
    end

    def self.command_separator=(command_separator)
      instance.command_separator = command_separator
    end

  end

end
