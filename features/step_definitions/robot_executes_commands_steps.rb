require 'parsers/file_parser'

Given(/^the robot is at \[(.*), (.*), (.*)\]$/) do |arg1, arg2, arg3|
  @bot.position = { x: arg1.to_i, y: arg2.to_i, face: arg3 }
end

Given(/^the command is (.*)$/) do |arg|
  @input = "{ \"commands\": \"#{arg}\" }"
end

When(/^the robot runs the command$/) do
  @input_parser.read @input
  @bot.run
end

Then(/^the robot position should be \[\-?(\d+), \-?(\d+), (.*)\]$/) do |arg1, arg2, arg3|
  expect(@bot.position).to eql({ x: arg1.to_i, y: arg2.to_i, face: arg3 })
end

Given(/^the input file is (.*)$/) do |arg1|
  @input = '/home/hadi/projects/locobot/spec/samples/' + arg1
end
