class MainController < ActionController::Base
  protect_from_forgery

  def index
    unless session[:access_token]
      redirect GithubOAuth.authorize_url('github_client_id', 'github_client_secret')
    end
    redirect_to pr_path
  end

  def oauth
  end

  def pr
  end
end
