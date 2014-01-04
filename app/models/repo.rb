class Repo

  def self.all(sort: "name")
    GithubApi.get_all('repos', 'all repos Repo#all', sort: name)
  end

end