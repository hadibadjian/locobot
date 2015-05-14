require 'config'
require 'controllers/core'
require 'parsers/json_parser'

Given(/^the robot is configured for JSON parser$/) do
  @input_parser = Locobot::Parser::JSONParser.new
  Locobot::Config.input_parser = @input_parser
  Locobot::Config.command_separator = '->'

  @bot = Locobot::Core.new
end

Given(/^the robot is configured for file parser$/) do
  @input_parser = Locobot::Parser::FileParser.new
  Locobot::Config.input_parser = @input_parser

  @bot = Locobot::Core.new
end
