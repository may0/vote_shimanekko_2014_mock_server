require 'sinatra'
require './user.rb'

log = File.open(File.expand_path("#{settings.root}/log/#{Time.now.strftime '%Y%m%d'}.log", __FILE__), "a")

get '/vote' do
  @title = "投票"
  erb :vote
end

post '/result' do
  user = User.new(email:params[:data][:Member][:email], password:params[:data][:Member][:password])

  if user.valid?
    log.puts "#{params[:data][:Member][:email]}:#{params[:data][:Member][:password]}"
    @title = "投票結果"
    erb :result
  else
    erb :error
  end
end