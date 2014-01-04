class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_key

  # for the github_api lib, jesus andrew, what are you doing..
  def set_key
    ENV["access_token"] =  session[:access_token]
  end
end
