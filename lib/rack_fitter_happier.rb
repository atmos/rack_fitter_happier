gem 'rack', '~>1.0.0'
require 'rack'

module Rack
  class FitterHappier
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == '/fitter_happier'
        return [200, { 'Content-Type' => 'text/plain' }, "FitterHappier Site Check Passed" ]
      else
        @app.call(env)
      end
    end
  end
end
