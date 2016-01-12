require 'sinatra'

get '/playa/resource' do
  content_type :json
  { :key1 => 'value1', :key2 => 'value2' }.to_json
end