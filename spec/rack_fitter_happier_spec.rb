require File.dirname(__FILE__) + '/spec_helper'

describe 'Rack::HoptoadNotifier' do
  before(:each) do
    @app = lambda { |env| [200, { }, "Hello, Suckers" ] }

  end

  it 'responds with a message saying that the site is live' do
    env = Rack::MockRequest.env_for("/fitter_happier", :method => 'GET', :input => 'THE BODY')
    response = Rack::FitterHappier.new(@app).call(env)
    response.first.should eql(200)
    response.last.should eql('FitterHappier Site Check Passed')
  end

  it 'forwards the request on if it does not match fitter_happier' do
    env = Rack::MockRequest.env_for("/", :method => 'GET', :input => 'THE BODY')
    response = Rack::FitterHappier.new(@app).call(env)
    response.first.should eql(200)
    response.last.should eql('Hello, Suckers')
  end
end
