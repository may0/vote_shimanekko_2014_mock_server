class Vote
  def initialize(params)
    @email = params[:email]
    @password = params[:password]
  end

  def valid?
    File.open(File.expand_path("../log/#{Time.now.strftime '%Y%m%d'}.log", __FILE__), "r") do |io|
      io.each do |line|
        next unless line.match(/.+@.+:.+/)
        tmp = line.split(":", 2)
        if @email == tmp[0].chomp && @password == tmp[1].chomp
          return true
        end
      end
      return false
    end
  end
end