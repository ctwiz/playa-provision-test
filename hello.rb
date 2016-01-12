require 'sinatra'
require 'json'


use Rack::Auth::Basic do |username, password|
  username == 'admin' and password == 'admin'
end

get '/playa/resource' do
  content_type :json
  { :key1 => 'value1', :key2 => 'value2' }.to_json
end