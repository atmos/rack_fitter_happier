require 'rack'
require 'lib/rack_fitter_happier'

use Rack::FitterHappier

run lambda { |env| [ 200, { 'Content-Type' => 'text/plain' }, 'Greetings!' ] }
