require 'sinatra'
require 'json'



use SimpleAuth do |username, password|
  username == 'playa' and password == 'test1234'
end

get '/playa/resource' do
  content_type :json
  id = 'id-1234-8888'
  result = { id: id, config: {PLAYA_RESOURCE_URL: "http://random_user:random_password@playa-provision-test.herokuapp.com/#{id}" } }
  result.to_json
end

get '/playa/sso' do
  params = request.env['rack.request.query_hash']
end


class SimpleAuth < Rack::Auth::Basic

  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/playa/resource'
      super
    else
      @app.call(env)
    end
  end

end