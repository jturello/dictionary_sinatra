class Definition
  attr_reader :text
  
  define_method(:initialize) do |text|
    @text = text
  end

end
