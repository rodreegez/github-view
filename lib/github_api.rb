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


  def self.get_all(type,readable_type, sort: nil)
    page = 1
    @items     = []

    while true do
      response  = GithubApi.get(type, page: page)

      raise "slowup on #{readable_type}" if response.code != 200

      if response.blank?
        if sort.nil?
         return @items
        else
          return @items.sort_by { |i| i[sort] }
        end
      end

      @items.concat response
      page = page + 1
    end
  end

end
