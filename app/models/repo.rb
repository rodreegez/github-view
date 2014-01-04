class Repo

  def self.all(sort: "name")
   repos             = []
   page              = 1

    while true do
      response = GithubApi.get('repos', page: page)

      raise "boom on repos" if response.code != 200
      return repos.sort_by { |r| r[sort] } if response.blank?

      repos.concat response
      page = page + 1
    end

  end


end