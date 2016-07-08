require('rspec')
require('word')
require('definition')

describe('#initialize') do

  it('instantiates a word object') do
    word = Word.new()
    expect(word.class).to eq(Word)
  end

end
