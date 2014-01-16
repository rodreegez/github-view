class MainController < ApplicationController

  def index
    if user_signed_in?
      @repos = Repo.all
      @issues = Issue.user_all
    end
  end

  def oauth
    session[:access_token] = GithubOAuth.token(ENV["GITHUB_ID"], ENV["GITHUB_SECRET"], params[:code])
    redirect_to "/" and return
  end

  def pr
  end
end
