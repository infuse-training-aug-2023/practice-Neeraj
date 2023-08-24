class ArrayManipulator
  def initialize(arr)
    @arr = arr
  end

  def element_at(index)
    return nil if index < 0 || index >= @arr.length
    @arr.at(index)
  end

  def exclusive_range(start_pos, end_pos)
    return nil if start_pos < 0 || end_pos >= @arr.length
    @arr[start_pos..end_pos]
  end

  def non_inclusive_range(start_pos, end_pos)
    return nil if start_pos < 0 || end_pos >= @arr.length
    @arr[start_pos...end_pos]
  end

  def start_and_length(start_pos, length)
    return nil if start_pos < 0 || start_pos + length > @arr.length
    @arr[start_pos..(start_pos + length - 1)]
  end
end
