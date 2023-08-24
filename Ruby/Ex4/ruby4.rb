class SportsManipulator
  attr_reader :sports

  def initialize(arr)
    @sports = arr
  end

  def skip_sports(count)
    result = []
    @sports.each_with_index do |sport, index|
      next if index < count
      result << "#{index}:#{sport}"
    end
    result
  end
end
