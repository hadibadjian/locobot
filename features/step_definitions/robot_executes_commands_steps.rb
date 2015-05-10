Given(/^the robot is at \[(\d+), (\d+), "([^"]*)"\]$/) do |arg1, arg2, arg3|
  @bot.position = [arg1.to_i, arg2.to_i, arg3]
end


Given(/^the command is PLACE\((\d+), (\d+), "([^"]*)"\)$/) do |arg1, arg2, arg3|
  @input = "{ \"commands\": \"PLACE (#{arg1.to_i}, #{arg2.to_i}, #{arg3})\" }"
end

Given(/^the command is MOVE$/) do
  @input = "{ \"commands\": \"MOVE\" }"
end

Given(/^the command is LEFT$/) do
  @input = "{ \"commands\": \"LEFT\" }"
end

Given(/^the command is RIGHT$/) do
  @input = "{ \"commands\": \"RIGHT\" }"
end

Given(/^the command is REPORT$/) do
  @input = "{ \"commands\": \"REPORT\" }"
end

When(/^the robot runs the command$/) do
  @bot.commands = @input
  @bot.run @bot.commands
end

Then(/^the robot position should be \[(\d+), (\d+), "([^"]*)"\]$/) do |arg1, arg2, arg3|
  expect(@bot.position).to eql([arg1.to_i, arg2.to_i, arg3])
end
