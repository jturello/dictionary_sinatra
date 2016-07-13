require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')
require('pry')
require('launchy')


get('/') do
  erb(:index)
end

get('/word_form') do
  erb(:word_form)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

post('/word') do
  @word = Word.find(params[:word_id].to_i)
  @word.add_definition(params[:definition])
  erb(:word)
end

post('/words/new') do
  word = params[:word]
  definition = params[:definition]
  @word = Word.new({:text => word, :definition => definition})
  @word.save()
  erb(:word)
end
