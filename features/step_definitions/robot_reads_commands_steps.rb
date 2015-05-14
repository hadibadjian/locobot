Given(/^the input is JSON formatted with command (.*)$/) do |arg|
  @input = "{ \"commands\": \"#{arg}\" }"
end

When(/^the robot receives the input$/) do
  @input_parser.read @input
end

Then(/^the processed command list should contain (\d+) commands$/) do |arg1|
  expect(@input_parser.commands_count).to eql(arg1.to_i)
end
