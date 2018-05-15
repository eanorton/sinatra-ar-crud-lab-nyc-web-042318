require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #new form
    erb :new
  end

  post '/posts' do  #make new posts
    @post = Post.create(params)
    redirect '/posts'
  end

  get '/posts' do #index
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do  #view
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #edit
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do  #update
    @post = Post.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :index
  end

  delete '/posts/:id/delete' do #delete
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end


end
