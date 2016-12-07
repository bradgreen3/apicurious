class GithubService

  def initialize(current_user)
    @current_user = current_user
  end

  def conn
    Faraday.new(:url => "https://api.github.com") do |f|
      f.params[:access_token] = @current_user.token
      f.adapter = Faraday.default_adapter
    end
  end

  def repos
    response = conn.get "/user/repos"
    JSON.parse(response.body, symbolize_names: true)
  end
end
