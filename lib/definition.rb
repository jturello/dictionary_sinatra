class Word

  class Definition
    attr_reader :text

    define_method(:initialize) do |args|

      if args[:text] == "" || args[:text] == nil
        raise ArgumentError.new("Invalid input: empty string and nil not allowed: #{args[:text]}")
      end

      @text = args[:text]
    end
  end
end
