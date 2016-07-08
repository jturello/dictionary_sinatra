class Word
  attr_reader :text, :id

  @@words = []

  define_method(:initialize) do |attributes|

    if attributes[:text] == ""
      raise ArgumentError.new('Invalid input: empty string not allowed!')
    end
    @text = attributes[:text]
    @id = @@words.length() + 1

  end


end
