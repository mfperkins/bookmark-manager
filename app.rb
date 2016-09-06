require 'sinatra/base'
require './app/models/link.rb'
ENV["RACK_ENV"] ||= "development"

class App < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:links_new)
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end
end
