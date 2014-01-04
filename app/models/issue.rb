class Issue

  def self.user_all
    GithubApi.get_all('issues', 'authenticate users issues Issue#user_all')
  end


end