require('rspec')
require('word')
require('definition')

describe(Word) do
  describe('#initialize') do

    it('instantiates a word object') do
      word = Word.new({:text => "sardonic"})
      expect(word.class).to eq(Word)
    end

    it('instantiates a word object with the text provided') do
      word = Word.new({:text => 'prestidigitation'})
      expect(word.text()).to eq('prestidigitation')
    end

    it('give Word object a id') do
      word = Word.new({:text => 'something'})
      expect(word.id()).not_to eq(nil)
    end

    it("raise ArgumentError when input is empty string") do
      begin
        definition = Word.new({:text => ""})
      rescue ArgumentError => e
        expect(e.message).to eq('Invalid input: empty string not allowed!')
      end
      expect(definition).to eq(nil)
    end

    # it("raise ArgumentError if word has less than one definition") do
    #
    # end

  end
end
