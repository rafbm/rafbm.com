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
end

use Rack::Deflater
run Rafbm
