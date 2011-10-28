require 'rubygems'
require 'goliath'

class Proxy < Goliath::API
  def response(env)
    [200, {}, "Hello goliath"]
  end
end
