require('rspec')
require('definition')

describe(Definition) do
  describe('#initialize') do

    it('instantiates a definition object') do
      definition = Definition.new({:text => ""})
      expect(definition.class).to eq(Definition)
    end

    it('instantiates a definition object with the text provided') do
      definition = Definition.new({:text => 'This is the text provided to the new() method'})
      expect(definition.text).to eq('This is the text provided to the new() method')
    end

  end
end
