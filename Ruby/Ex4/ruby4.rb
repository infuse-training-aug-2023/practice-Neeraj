class SportsManipulator
    attr_reader :sports
  
    def initialize(arr)
      @sports = arr
    end
  
    def skip_sports(count)
      @sports[count..-1]
    end
  end
  