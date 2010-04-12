require 'rubygems'
require 'sinatra'
require 'erb'

# 8. gyak
enable :sessions

get "/" do
    erb :home
end

post "/login" do
    if params[:user]=="bgotti" and params[:pass]=="jelszo"
	session[:logged_in]=true
	session[:notice]="Sikeres bejelentkezes!"
	redirect "/titok"
    else
	session[:error]="Hibas felhasznalonev vagy jelszo!"
	redirect "/"
    end
end

get "/logout" do
    session[:logged_in]=nil
    session[:notice]="Sikeres kijelentkezes!"
    redirect "/"
end

get "/titok" do
    if session[:logged_in]
	erb "<h2>...titok..</h2>"
    else
	session[:error]="Nem vagy bejelentkezve!"
	redirect "/"
    end
end

# eddig tart, ami gyakon volt...

#get "/" do
#    erb :homehi
#end

get "/hi" do
    "<h1>Hello, World!</h1>"
end

get "/hi/:name" do
    erb :hi
end