PrView::Application.routes.draw do

  devise_for :users, :controllers => { 
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  def get(path,controller,name,as = name)
    match path => controller + '#' + name, :as => as, :via => [:get]
  end

  def post(path,controller,name,as = name)
    match path => controller + '#' + name, :as => as, :via => [:post]
  end

  get('/','main','index')
  get('/oauth','main',"oauth")

  get('/repos/:id','repo',"show")

  root :to => "main#index"
end
