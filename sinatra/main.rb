require 'sinatra'
require './user.rb'
require './vote.rb'

File.open(File.expand_path("#{settings.root}/log/#{Time.now.strftime '%Y%m%d'}.log", __FILE__), "a").close()

get '/vote' do
  @title = "投票"
  erb :vote
end

post '/result' do
  user = User.new(email:params[:data][:Member][:email], password:params[:data][:Member][:password])
  vote = Vote.new(email:params[:data][:Member][:email], password:params[:data][:Member][:password])

  if vote.valid?
    @title = "投票結果"
    @description = "本日は既に投票済みです"
    erb :result
  elsif user.valid?
    File.open(File.expand_path("#{settings.root}/log/#{Time.now.strftime '%Y%m%d'}.log", __FILE__), "a") do |log|
      log.puts "#{params[:data][:Member][:email]}:#{params[:data][:Member][:password]}"
    end
    @title = "投票結果"
    @description = "投票完了"
    erb :result
  else
    erb :error
  end
end