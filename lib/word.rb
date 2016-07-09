class Word
  attr_reader :text, :id, :definitions

  @@words = []

  define_method(:initialize) do |args|

    if args[:text] == "" || args[:text] == nil
      raise ArgumentError.new('Invalid input: nil or empty string not allowed!')
    end

    if args[:definitions] == nil || args[:definitions].length() < 1 || args[:definitions] == ['']
      raise ArgumentError.new('Invalid input: Word must contain at least one definition!')
    end

    @text = args[:text]
    @definitions = args[:definitions].slice(0, args[:definitions].length())
    @id = @@words.length() + 1

  end

  define_method(:definitions) do
    # return array by value and not Array's default - by reference
    @definitions.slice(0, @definitions.size())
  end

end
