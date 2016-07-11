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

    it("raise ArgumentError when :text param is ''") do
      expect{Word.new({:definitions => ['stuff']})}.to raise_error(ArgumentError)
    end


    it('instantiate a Word with at least one definition') do
      word = Word.new({:text => 'something', :definitions => ['first definition']})
      # puts word.definitions.inspect
      expect(word.definitions.size()).to be > 0
    end

    it("raise ArgumentError when definition empty - [] = invalid input") do
      expect{Word.new({:text => 'something', :definitions => []})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError when definition is '' - [''] = invalid input") do
      expect{Word.new({:text => 'something', :definitions => ['']})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError when definition empty - nil = invalid input") do
      expect{Word.new({:text => 'something'})}.to raise_error(ArgumentError)
    end


  end
end
