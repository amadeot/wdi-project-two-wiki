module App
  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions
    get "/" do 
      redirect to "/home" if session[:user_id]
      erb :index
    end
    get "/home" do
      redirect to "/" if !session[:user_id]
      erb :home
    end

    get "/sign_up" do
      erb :sign_up
    end

    post "/sign_up" do
      User.create(username: params["username"], email: params["email"])
      redirect to "/sign_in"
    end

    get "/sign_in" do
      erb :sign_in
    end

    post "/sessions" do 
      user = User.find_by({username: params[:username]})
      session[:user_id] = user.id
      redirect to "/"
    end



  end
end
