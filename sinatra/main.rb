require 'sinatra'

log = File.open(File.expand_path("#{settings.root}/log/#{Time.now.strftime '%Y%m%d'}.log", __FILE__), "a")

get '/vote' do
  @title = "投票"
  erb :vote
end

post '/result' do
  email = params[:data][:Member][:email]
  password = params[:data][:Member][:password]

  isUser = 0
  File.open(File.expand_path("#{settings.root}/configs", __FILE__), "r") do |io|
    io.each do |line|
      next unless line.match(/.+@.+:.+/)
      tmp = line.split(":", 2)
      if email == tmp[0].chomp && password == tmp[1].chomp
        isUser = 1
      end

    end
  end

  if isUser == 1
    log.puts "#{email}:#{password}"
    @title = "投票結果"
    erb :result
  else
    erb :error
  end
end