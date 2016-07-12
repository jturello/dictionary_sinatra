require('rspec')
require('word')
require('definition')

describe(Word) do
before(:each) do
  Word.clear()
end

  describe('#initialize') do

    it('instantiates a word object') do
      word = Word.new({:text => "sardonic", :definition => 'this'})
      expect(word.class).to eq(Word)
    end

    it('instantiates a word object with the text provided') do
      word = Word.new({:text => 'splat', :definition => 'that'})
      expect(word.text()).to eq('splat')
    end

    it('give Word object a id') do
      word = Word.new({:text => 'something', :definition => 'the other'})
      expect(word.id()).not_to eq(nil)
    end

    it('instantiate a Word with a definition') do
      word = Word.new({:text => 'something', :definition => 'first definition'})
      expect(word.definitions.size()).to be > 0
    end

    it("raise ArgumentError when :text param is nil") do
      expect{Word.new({:definition => 'stuff'})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError when :text param is ''") do
      expect{Word.new({:definition => 'stuff'})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError when definition is nil = invalid input") do
      expect{Word.new({:text => 'something', :definition => nil})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError when definition is '' = invalid input") do
      expect{Word.new({:text => 'something', :definition => ''})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError when definition empty - nil = invalid input") do
      expect{Word.new({:text => 'something'})}.to raise_error(ArgumentError)
    end

    it('instantiates and stores definition objects in a local variable array in the Word object') do
      word = Word.new({:text => 'something', :definition => 'definition one'})
      expect(word.definitions[0].class).to eq(Word::Definition)
    end

  end

  describe('#save') do
    it('adds a word to the word list') do
      word = Word.new({:text => 'something', :definition => 'definition one'})
      word.save()
      expect(Word.all()).to eq([word])
    end
  end

  describe('.all') do
    it('is empty before any words are saved') do
      expect(Word.all()).to eq([])
    end
  end

  describe('.clear') do
    it('deletes all words form the word list') do
      word1 = Word.new({:text => 'stick', :definition => 'definition one'})
      word2 = Word.new({:text => 'prawn', :definition => 'definition one'})
      word1.save()
      word2.save()
      Word.clear()
      expect(Word.all()).to eq([])
    end
  end
end
