module GithubApi
  def self.get(url, page: 1, per_page: 100)
    url = "#{ENV["GITHUB_URL"]}orgs/mintdigital/#{url}?page=#{page}&per_page=#{per_page}"
    HTTParty.get(url,
      :headers => {
        "Authorization" => "token #{ENV["access_token"]}",
        "User-Agent" => "boomf"
      }
    )
  end
end
