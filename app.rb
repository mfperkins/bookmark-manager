require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
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
    @link = Link.create(url: params[:url], title: params[:title])
    @tag = Tag.create(tag: params[:tag])
    @link.tags << @tag
    @link.save
    redirect '/links'
  end

  get '/tags/bubbles' do
    @links = Link.all(:tags => {:tag => 'Bubbles'})
    erb(:tags)
  end

end
