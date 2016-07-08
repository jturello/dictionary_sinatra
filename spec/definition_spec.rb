require('rspec')
require('definition')

describe(Definition) do
  describe('#initialize') do

    it('instantiates a definition object') do
      definition = Definition.new()
      expect(definition.class).to eq(Definition)
    end

  end
end
