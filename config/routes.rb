PrView::Application.routes.draw do

  def get(path,controller,name,as = name)
    match path => controller + '#' + name, :as => as, :via => [:get]
  end

  def post(path,controller,name,as = name)
    match path => controller + '#' + name, :as => as, :via => [:post]
  end

  get('/','main','index')
  get('/repos/:id','repo',"show")
end
