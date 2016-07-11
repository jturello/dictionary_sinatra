require('rspec')
require('definition')

describe(Word::Definition) do
  describe('#initialize') do

    it('instantiates a definition object') do
      definition = Word::Definition.new({:text => "some text"})
      expect(definition.class).to eq(Word::Definition)
    end

    it('instantiates a definition object with the text provided') do
      definition = Word::Definition.new({:text => 'This is the text provided to the new() method'})
      expect(definition.text()).to eq('This is the text provided to the new() method')
    end

    it("raises ArgumentError when :text param is empty string") do
      expect{Word::Definition.new({:text => ""})}.to raise_error(ArgumentError)
    end

    it("raises ArgumentError when :text param is nil") do
      expect{Word::Definition.new({})}.to raise_error(ArgumentError)
    end

    it('contains a reference to the word it defines') do
      word = Word.new({:text => 'something', :definitions => ['first definition']})
      Word::Definition.new({:text => "something"})
    end

  end
end
