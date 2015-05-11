Given(/^the robot is at \[(.*), (.*), (.*)\]$/) do |arg1, arg2, arg3|
  @bot.position = [arg1.to_i, arg2.to_i, arg3]
end

Given(/^the command is (.*)$/) do |arg|
  @input = "{ \"commands\": \"#{arg}\" }"
end

When(/^the robot runs the command$/) do
  @bot.commands = @input
  @bot.run @bot.commands
end

Then(/^the robot position should be \[\-?(\d+), \-?(\d+), (.*)\]$/) do |arg1, arg2, arg3|
  expect(@bot.position).to eql([arg1.to_i, arg2.to_i, arg3])
end
