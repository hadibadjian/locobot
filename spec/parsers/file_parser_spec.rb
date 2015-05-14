require 'spec_helper'
require 'parsers/file_parser'

RSpec.describe Locobot::Parser::FileParser do

  before(:each) do
    @parser = Locobot::Parser::FileParser.new
  end

  it "should respond to read" do
    expect(@parser).to respond_to(:read)
  end

  it "should respond to next_command" do
    expect(@parser).to respond_to(:next_command)
  end

  context "with correctly formatted input file" do

    before(:each) do
      file_path = '/home/hadi/projects/locobot/spec/samples/file_parser_sample_1.txt'
      @parser.read(file_path)
    end

    it "should parse commands correctly" do
      expect(@parser.commands_count).to eql(3)
    end

    it "should provide correct next command" do
      3.times.each do |n|
        command = @parser.next_command
        expect(command).not_to be_nil
      end
    end

    it "should parse commands in correct order" do
      expect(@parser.next_command).to be_kind_of(Locobot::Commands::Place)
    end

  end

end
