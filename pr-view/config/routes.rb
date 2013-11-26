PrView::Application.routes.draw do

  def get(path,name,as = name)
    match path => 'main#' + name, :as => as, :via => [:get]
  end

  def post(path,name,as = name)
    match path => 'main#' + name, :as => as, :via => [:post]
  end

  get('/','home')
  get('pr','pr')
  get('oauth',"oauth")
end
