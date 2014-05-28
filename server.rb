require 'sinatra'
require 'shotgun'
require 'csv'
require 'pry'

get '/' do

  erb  :index
end


get '/about' do


  erb :'about/show'
end
