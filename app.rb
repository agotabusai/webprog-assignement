require 'rubygems'
require 'sinatra'
require 'erb'

get "/" do
    erb :home
end

get "/hi" do
    "<h1>Hello, World!</h1>"
end

get "/hi/:name" do
    erb :hi
end