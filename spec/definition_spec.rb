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

    it("raise ArgumentError when input is empty string") do
      begin
        definition = Definition.new({:text => ""})
      rescue ArgumentError => e
        expect(e.message).to eq('Invalid input: empty string not allowed!')
      end
      expect(definition).to eq(nil)
    end

  end
end
