Given(/^the robot is configured$/) do
  Locobot::Config.input_parser = Locobot::JsonParser.new

  @bot = Locobot::Core.new
end

Given(/^the input is comma separated command (.*)$/) do |arg|
  @input = "{ \"commands\": \"#{arg}\" }"
end

When(/^the robot receives the input$/) do
  @bot.commands = @input
end

Then(/^the processed command list should contain (\d+) commands$/) do |arg1|
  expect(@bot.commands.count).to eql(arg1.to_i)
end
