class SerialAverageCalculator
  def initialize(serial_number, xx, yy)
    @serial_number = serial_number
    @xx = xx.to_f
    @yy = yy.to_f
  end

  def calculate_average
    average = ((@xx + @yy) / 2).round(2)
    average
  end

  def formatted_result
    "#{@serial_number}-#{'%.2f' % calculate_average}"
  end
end
