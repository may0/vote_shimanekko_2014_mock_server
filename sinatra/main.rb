require 'sinatra'

get '/vote' do
  @title = "投票"
  erb :vote
end