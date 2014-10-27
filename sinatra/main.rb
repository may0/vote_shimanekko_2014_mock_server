require 'sinatra'

get '/vote' do
  @title = "投票"
  erb :vote
end

post '/result' do
  @title = "投票結果"
  erb :result
end