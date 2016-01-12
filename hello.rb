require 'sinatra'
require 'json'


use Rack::Auth::Basic do |username, password|
  username == 'playa' and password == 'test1234'
end

get '/playa/resource' do
  content_type :json
  { :key1 => 'value1', :key2 => 'value2' }.to_json
end