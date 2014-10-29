require 'sinatra'

log = File.open(File.expand_path("#{settings.root}/log/#{Time.now.strftime '%Y%m%d'}.log", __FILE__), "a")

get '/vote' do
  @title = "投票"
  erb :vote
end

post '/result' do
  log.puts "#{params[:data]}"
  @title = "投票結果"
  erb :result
end