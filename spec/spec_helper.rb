require 'codeclimate-test-reporter'
require 'simplecov'
SimpleCov.start
CodeClimate::TestReporter.start

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'create_send_rails'
