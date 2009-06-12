require 'pp'
ENV['RACK_ENV'] = 'test'
$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')
require 'rack_fitter_happier'
