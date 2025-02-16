Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  
  get("/directors", { :controller => "director", :action => "index" })
  get("/directors/eldest", { :controller => "director", :action => "show_eldest" })
  get("/directors/youngest", { :controller => "director", :action => "show_youngest" })
  get("/directors/:id", { :controller => "director", :action => "detail" })

  get("/movies", { :controller => "movie", :action => "index" })
  get("/movies/:id", { :controller => "movie", :action => "detail" })

  get("/actors", { :controller => "actor", :action => "index" })
  get("/actors/:id", { :controller => "actor", :action => "detail" })

  
  get("/about", { :controller => "misc", :action => "about" })
end
