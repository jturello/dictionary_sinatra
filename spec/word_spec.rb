require('rspec')
require('word')
require('definition')

describe(Word) do
  describe('#initialize') do

    it('instantiates a word object') do
      word = Word.new({:text => "sardonic", :definitions => ['this']})
      expect(word.class).to eq(Word)
    end

    it('instantiates a word object with the text provided') do
      word = Word.new({:text => 'splat', :definitions => ['that']})
      expect(word.text()).to eq('splat')
    end

    it('give Word object a id') do
      word = Word.new({:text => 'something', :definitions => ['the other']})
      expect(word.id()).not_to eq(nil)
    end

    it("raise ArgumentError when :text param is nil") do
      expect{Word.new({:definitions => ['stuff']})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError when :text param is empty string ''") do
      expect{Word.new({:definitions => ['stuff']})}.to raise_error(ArgumentError)
    end


    it('instantiate a Word if it has at least one definition') do
      word = Word.new({:text => 'something', :definitions => ['first definition']})
      expect(word.definitions.size()).to be > 0
    end

    it("raise ArgumentError if Word has less than one definition - empty array [] invalid") do
      expect{Word.new({:text => 'something', :definitions => []})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError if Word has less than one definition - nil param invalid") do
      expect{Word.new({:text => 'something'})}.to raise_error(ArgumentError)
    end

  end
end
