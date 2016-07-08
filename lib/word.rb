class Word
  attr_reader :text

  define_method(:initialize) do |attributes|

    if attributes[:text] == ""
      raise ArgumentError.new('Invalid input: empty string not allowed!')
    end
    @text = attributes[:text]
  end


end
