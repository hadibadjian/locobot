require 'rspec/expectations'

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../')
require 'app/config'
require 'app/controllers/core'
require 'app/parsers/json_parser'
require 'app/parsers/file_parser'
