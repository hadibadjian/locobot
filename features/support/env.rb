require 'rspec/expectations'

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../app')
require 'config'
require 'controllers/core'
require 'adapters/json_parser'
