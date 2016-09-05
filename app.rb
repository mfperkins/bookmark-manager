require 'sinatra/base'
require './app/models/link.rb'
class App < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end









end
