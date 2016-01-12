require 'sinatra'
require 'json'


use Rack::Auth::Basic do |username, password|
  username == 'playa' and password == 'test1234'
end

get '/playa/resource' do
  content_type :json
  { :PLAYA_WEBSITE_URL: '' }.to_json
  result = { id: 'id-1234-8888', config: {"PLAYA_RESOURCE_URL": "http://random_user:random_password@playa-provision-test.herokuapp.com/id-1234-8888" } }
end