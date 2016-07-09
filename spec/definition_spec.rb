require('rspec')
require('definition')

describe(Definition) do
  describe('#initialize') do

    it('instantiate a definition object') do
      definition = Definition.new({:text => "some text"})
      expect(definition.class).to eq(Definition)
    end

    it('instantiate a definition object with the text provided') do
      definition = Definition.new({:text => 'This is the text provided to the new() method'})
      expect(definition.text()).to eq('This is the text provided to the new() method')
    end

    it("raise ArgumentError when :text param is empty string") do
      expect{Definition.new({:text => ""})}.to raise_error(ArgumentError)
    end

    it("raise ArgumentError when :text param is nil") do
      expect{Definition.new({:definitions => ['stuff']})}.to raise_error(ArgumentError)
    end

  end
end
