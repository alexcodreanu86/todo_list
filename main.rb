require 'rubygems'
require 'slim'
require 'sinatra'
require_relative 'config/application'

get "/" do 
  @tasks = Task.all
  slim :index
end

get "/:task" do
  @task = params[:task].split('-').join(' ').capitalize
  slim :task
end

post '/' do
  Task.create(params[:task])
  redirect to '/'
end

delete "/task/:id" do
  Task.find(params[:id]).destroy
  redirect to '/'
end

put "/task/:id" do
  task = Task.find(params[:id])
  task.complete = task.complete == 0 ? 1 : 0  
  task.save
  redirect to "/"
end