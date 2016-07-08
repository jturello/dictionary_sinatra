require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/dictionary_sinatra')
require('pry')
require('launchy')


# get('/') do
#   erb(:index)
# end
#
# get('/word') do
#   erb(:word)
# end
