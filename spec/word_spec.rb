require('rspec')
require('word')
require('definition')

describe(Word) do
  describe('#initialize') do

    it('instantiates a word object') do
      word = Word.new({:text => ""})
      expect(word.class).to eq(Word)
    end

    it('instantiates a word object with the text provided') do
      word = Word.new({:text => 'prestidigitation'})
      expect(word.text()).to eq('prestidigitation')
    end

  end
end
