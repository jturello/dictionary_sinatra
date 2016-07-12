class Word
  attr_reader :text, :id, :definitions

  @@words = []

  define_method(:initialize) do |args|
    @definitions = []

    if args[:text] == "" || args[:text] == nil
      raise ArgumentError.new('Invalid input: nil or empty string not allowed!')
    end

    if args[:definitions] == nil || args[:definitions].length() < 1 || args[:definitions] == ['']
      raise ArgumentError.new('Invalid input: Word must contain at least one definition!')
    end

    @text = args[:text]
    definitions_str_arr = args[:definitions].slice(0, args[:definitions].length())
    definitions_str_arr.each do |definition|
      @definitions.push(Word::Definition.new({:text => definition}))
    end
    @id = @@words.length() + 1
  end

  define_method(:definitions) do
    # return array by value, not by reference (Array class default)
    @definitions.slice(0, @definitions.size())
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
