require 'sinatra'
require 'json'

# Serving at 
# http://playa-provision-test.herokuapp.com/playa/resource
# and
# http://playa-provision-test.herokuapp.com/playa/sso

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

use SimpleAuth do |username, password|
  username == 'playa' and password == 'test1234'
end

post '/playa/resource' do
  content_type :json
  id = 'id-1234-8888'
  result = { id: id, config: {PLAYA_RESOURCE_URL: "http://random_user:random_password@playa-provision-test.herokuapp.com/#{id}" } }
  result.to_json
end

post '/playa/sso' do
  require 'digest/sha1'
  #params = request.env['rack.request.query_hash']
  #@params={"authenticity_token"=>"LIg0b4JemBFvId4u55avPLq5xv8hrhImV3dWn6w2q9Ki79zb144mJnnDjUmskRo+EEyG8mL4ahhgFrF+ZkGeqA==", "provision_id"=>"83a0241b-ffad-49c2-8b78-12931fffccb4", "token"=>"c4dc14261719d225d4b1319d5db12aba3f100542", "timestamp"=>"1453009586", "email"=>"ournive+test4@gmail.com"}
  # salt taken from tmp app
  salt = "d84973a6ed95a122495351e51bd2133d"

  expected_token = params[:provision_id] + salt + params[:timestamp]
  expected_token = Digest::SHA1.hexdigest expected_token

  puts "Expected token: " + expected_token
  puts "Received token: " + params[:token]
end


