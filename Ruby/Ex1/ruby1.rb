class SerialAverageCalculator
  attr_reader :serial_number, :xx, :yy

  class InvalidInputFormatError < StandardError
    def message
      "Invalid input string format"
    end
  end

  def initialize(input_string)
    if !valid_input_format?(input_string)
      raise InvalidInputFormatError
    end

    @serial_number = input_string[0, 3]
    @xx = input_string[4, 5].to_f
    @yy = input_string[10, 5].to_f
    @average = nil
  end

  def average
    @average ||= (@xx + @yy) / 2
  end

  def get_serial_average
    "#{serial_number}-#{"%.2f" % average}"
  end

  private

  def valid_input_format?(input_string)
    /\A\d{3}-\d{2}\.\d{2}-\d{2}\.\d{2}\z/.match?(input_string)
  end
end