require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
require './app/models/link.rb'
require './app/models/user.rb'
require 'bcrypt'

ENV["RACK_ENV"] ||= "development"

class App < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @user = session[:user]
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:links_new)
  end

  post '/links' do
    @link = Link.create(url: params[:url], title: params[:title])
    @inputtag = params[:tag].split(", ")
    @inputtag.each do |tag|
      @tag = Tag.create(tag: tag)
      @link.tags << @tag
    end
    @link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb(:links)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    session[:user] = User.create(name: params[:name], email: params[:email], password_hash: BCrypt::Password.create(params[:password])).name
    redirect '/links'
  end

end
