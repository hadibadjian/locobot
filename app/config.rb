module Locobot

  class Config

    include Singleton

    attr_accessor :input_parser

    def self.input_parser
      instance.input_parser
    end

    def self.input_parser=(input_parser)
      instance.input_parser = input_parser
    end

  end

end
