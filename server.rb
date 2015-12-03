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
      User.create(username: params["username"], email: params["email"], password: params[:password], password_confirmation: params[:password_confirmation])
      redirect to "/sign_in"
    end

    get "/sign_in" do
      erb :sign_in
    end

    post "/sessions" do 
      user = User.find_by({username: params[:username]}).try(:authenticate, params[:password])
      if user
        session[:user_id] = user.id
        redirect to "/home"
      else
        redirect to "/sign_in"
      end
    end

    delete "/sessions" do
      session[:user_id] = nil
      redirect to "/"
    end

    get "/articles" do
      redirect to "/" if !session[:user_id]
      @articles = Article.all
      erb :list_all_articles # erb :'articles/index'
    end

    get "/articles/new" do 
      redirect to "/" if !session[:user_id]
      erb :create_article
    end

    post "/articles/new" do 
      Article.create(header: params[:header], body_text: params[:body_text], user_id: session[:user_id], updated_at: DateTime.now)
      redirect to "/home"
    end

    get "/articles/:id" do
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      @author = User.find(@article.user_id)
      erb :show_article
    end

    get "/articles/:id/edit" do 
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      erb :edit_article
    end

    patch "/articles/:id" do
      article = Article.find(params[:id])
      @category = Category.find_by(name: params[:name]) || Category.create(name: params[:name])
      article.update(header: params[:header], body_text: params[:body_text], user_id: session[:user_id], updated_at: DateTime.now)
      article.categories.push(@category)
      article.save
      redirect to "/articles/#{params[:id]}"
    end

    get "/categories" do
      redirect to "/" if !session[:user_id]
      @categories = Category.all
      erb :list_categories
    end

    get "/categories/:id" do
      redirect to "/" if !session[:user_id]
      @category = Category.find(params[:id])
      @articles = @category.articles
      erb :list_all_articles
    end
  end
end
