require 'rubygems'
require 'eventmachine'
require 'evma_httpserver'

class HelloWorld < EM::Connection
  include EM::HttpServer

   def post_init
     super
     no_environment_strings
   end

  def process_http_request
    response = EM::DelegatedHttpResponse.new(self)
    response.status = 200
    response.content_type 'text/html'
    response.content = 'Hello EM'
    response.send_response
  end
end

EM.run{
  EM.start_server '0.0.0.0', 8080, HelloWorld
}