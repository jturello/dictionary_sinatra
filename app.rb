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

post('/word_form') do
  word = params[:word]
  definition = params[:definition]
  @word = Word.new({:text => word, :definition => definition})
  @word.save()
  erb(:word)
end

get('/word_form') do
  erb(:word_form)
end

post('/word') do
  word_id = params[:word_id].to_i
  @word = Word.find(word_id)
  @word.add_definition(params[:definition])
  erb(:word)
end
