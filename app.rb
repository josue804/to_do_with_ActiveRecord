require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require("./lib/task")
require("./lib/list")
require("pg")


get('/') do
  @lists = List.all()
  erb(:index)
end

post('/') do
  name = params['list']
  List.create({:name => name})
  @lists = List.all()
  erb(:index)
end

get('/list/:id') do
  @list = List.find(params['id'].to_i)
  erb(:list)
end

post('/list/:id') do
  description = params['task']
  list_id = params['id'].to_i
  rank = params['rank'].to_i
  Task.create({:description => description, :list_id => list_id, :rank => rank})
  @list = List.find(list_id)
  erb(:list)
end

get('/task/:id/edit') do
  @task = Task.find(params['id'].to_i)
  erb(:edit)
end

patch('/task/:id/edit') do
  @task = Task.find(params['task_id'].to_i)
  description = params['description']
  rank = params['rank'].to_i
  @task.update(:description => description, :rank => rank)
  list_id = params['list_id'].to_i
  @list = List.find(list_id)
  erb(:list)
end
