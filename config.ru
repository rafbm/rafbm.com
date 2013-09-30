class Rafbm
  HTML = [File.read('index.html')]
  NOT_FOUND = ['404']

  def self.call(env)
    if env['REQUEST_URI'] == '/'
      [200, {'Content-Type' => 'text/html'}, HTML]
    else
      [404, {'Content-Type' => 'text/html'}, NOT_FOUND]
    end
  end

  if ENV['RACK_ENV'] == 'production'
    # See: https://newrelic.com/docs/ruby/rack-and-metal-support-in-the-ruby-agent
    require 'newrelic_rpm'
    require 'new_relic/agent/instrumentation/rack'
    extend ::NewRelic::Agent::Instrumentation::Rack
  end
end

use Rack::Deflater
run Rafbm
