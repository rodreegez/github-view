class MainController < ApplicationController

  def index
    unless session[:access_token]
      redirect_to GithubOAuth.authorize_url(ENV["GITHUB_ID"], ENV["GITHUB_SECRET"]) and return
    end
    @repos = Repo.all
    @issues = Issue.user_all
  end

  def oauth
    session[:access_token] = GithubOAuth.token(ENV["GITHUB_ID"], ENV["GITHUB_SECRET"], params[:code])
    redirect_to "/" and return
  end

  def pr
  end
end
