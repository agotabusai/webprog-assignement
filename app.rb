require 'rubygems'
require 'sinatra'
require 'erb'

# 8. gyak
enable :sessions

get "/" do
    erb :homelogin
end

post "/login" do
    if params[:user]=="bgotti" and params[:pass]=="jelszo"
	session[:logged_in]=true
	redirect "/titok"
    else
	redirect "/hiba"
    end
end

get "/titok" do
    if session[:logged_in]
	erb :titok
    else
	redirect "/hiba"
    end
end

get "/hiba" do
    erb :hiba
end

# eddig tart, ami gyakon van
get "/hi" do
    "<h1>Hello, World!</h1>"
end

get "/hi/:name" do
    erb :hi
end