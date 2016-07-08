class Word
  attr_reader :text

  define_method(:initialize) do |attributes|
    @text = attributes[:text]
  end


end
