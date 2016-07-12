class Word
  attr_reader :text, :id, :definitions

  @@words = []

  define_method(:initialize) do |args|
    @definitions = []

    if args[:text] == "" || args[:text] == nil
      raise ArgumentError.new('Invalid input: nil or empty string not allowed!')
    end

    if args[:definition] == "" || args[:definition] == nil
      raise ArgumentError.new('Invalid input: nil or empty string not allowed!')
    end

    @text = args[:text]
    @definitions.push(Word::Definition.new({:text => args[:definition]}))

    @id = @@words.length() + 1

  end

  define_method(:definitions) do
    # return array by value, not by reference (Array class default)
    @definitions #.slice(0, @definitions.size())
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

end
