class GithubService

  def initialize(token)
    @token = token
  end

  def conn
    Faraday.new(:url => "https://api.github.com") do |f|
      f.params[:access_token] = token
      f.adapter                 Faraday.default_adapter
    end
  end

  def repos
    response = conn.get "/user/repos"
    JSON.parse(response.body, symbolize_names: true)
  end

  def starred_repos
    response = conn.get "/user/starred"
    JSON.parse(response.body, symbolize_names: true)
  end

  def events(username)
    response = conn.get "/users/#{username}/received_events"
    JSON.parse(response.body, symbolize_names: true)
  end

  def commits(username)
    response = conn.get "users/#{username}/events"
    JSON.parse(response.body, symbolize_names: true)
  end

  def organizations
    response = conn.get "/user/orgs"
    JSON.parse(response.body, symbolize_names: true)
  end

  private
      attr_reader :token
end
