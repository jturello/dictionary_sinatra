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
  defi = params[:definition]
  @entry = Word.new({:text => word, :definition => defi})
  @entry.save()

  erb(:word)

end

get('/word_form') do
  erb(:word_form)
end
