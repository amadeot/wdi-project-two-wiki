module App
  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions
    $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    get "/" do 
      redirect to "/home" if session[:user_id]
      erb :index
    end

    get "/home" do
      redirect to "/" if !session[:user_id]
      @user = User.find(session[:user_id])
      erb :home
    end

    get "/sign_up" do
      erb :'users/sign_up'
    end

    post "/sign_up" do
      User.create(username: params["username"], email: params["email"], password: params[:password], password_confirmation: params[:password_confirmation])
      redirect to "/sign_in"
    end

    get "/sign_in" do
      erb :'users/sign_in'
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

    get "/signout" do
      session[:user_id] = nil
      redirect to "/"
    end

    get "/articles" do
      redirect to "/" if !session[:user_id]
      @articles = Article.all
      erb :'articles/list_all_articles'
    end

    get "/articles/new" do 
      redirect to "/" if !session[:user_id]
      erb :'articles/create_article'
    end

    post "/articles/new" do 
      Article.create(header: params[:header], body_text: params[:body_text], user_id: session[:user_id], created_at: DateTime.now, updated_at: DateTime.now)
      redirect to "/home"
    end

    get "/articles/:id" do
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      if Editor.find_by(article_id: params[:id])
        @editor = User.find(Editor.where(article_id: params[:id]).last.user_id)
      else 
        @editor = User.find(@article.user_id)
      end
      @author = User.find(@article.user_id)
      erb :'articles/show_article'
    end

    get "/articles/:id/log" do
      redirect to "/" if !session[:user_id]
      @editors = Editor.where(article_id: params[:id])
      @article = Article.find(params[:id])
      erb :'other_lists/log'
    end

    get "/articles/:id/edit" do 
      redirect to "/" if !session[:user_id]
      @article = Article.find(params[:id])
      erb :'articles/edit_article'
    end

    patch "/articles/:id" do
      article = Article.find(params[:id])
      @category = Category.find_by(name: params[:name]) || Category.create(name: params[:name])
      article.update(header: params[:header], body_text: params[:body_text], updated_at: DateTime.now)
      article.categories.push(@category)
      article.save
      Editor.create(user_id: session[:user_id], article_id: params[:id], updated_at: DateTime.now)
      redirect to "/articles/#{params[:id]}"
    end

    get "/categories" do
      redirect to "/" if !session[:user_id]
      @categories = Category.all
      erb :'other_lists/list_categories'
    end

    get "/categories/:id" do
      redirect to "/" if !session[:user_id]
      @category = Category.find(params[:id])
      @articles = @category.articles
      erb :'articles/list_all_articles'
    end

    get "/log" do
      redirect to "/" if !session[:user_id]
      @editors = Editor.all
      erb :'other_lists/log'
    end

    get "/user/edit" do
      redirect to "/" if !session[:user_id]
      @user = User.find(session[:user_id])
      erb :'users/edit_user'
    end

    patch "/user" do 
      user = User.find(session[:user_id])
      user.update(username: params[:username], email: params[:email])
      redirect to "/home"
    end

  end
end
