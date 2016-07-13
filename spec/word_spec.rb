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

    it('instantiates a word object with text') do
      word = Word.new({:text => 'splat', :definition => 'that'})
      expect(word.text()).to eq('splat')
    end

    it('instantiates a Word object with an id') do
      word = Word.new({:text => 'something', :definition => 'the other'})
      expect(word.id()).not_to eq(nil)
    end

    it('instantiates a Word with a definition') do
      word = Word.new({:text => 'something', :definition => 'first definition'})
      expect(word.definitions.size()).to be > 0
    end

    it('stores definitions in an array') do
      word = Word.new({:text => 'something', :definition => 'definition one'})
      expect(word.definitions[0].class).to eq(Word::Definition)
    end

    context('ArgumentError is raised for invalid constructor input') do

      it("when :text param is nil") do
        expect{Word.new({:definition => 'stuff'})}.to raise_error(ArgumentError)
      end

      it("when :text param is empty string") do
        expect{Word.new({:definition => 'stuff'})}.to raise_error(ArgumentError)
      end

      it("when definition is nil") do
        expect{Word.new({:text => 'something', :definition => nil})}.to raise_error(ArgumentError)
      end

      it("when definition is empty string") do
        expect{Word.new({:text => 'something', :definition => ''})}.to raise_error(ArgumentError)
      end

      it("when definition not provided") do
        expect{Word.new({:text => 'something'})}.to raise_error(ArgumentError)
      end
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
