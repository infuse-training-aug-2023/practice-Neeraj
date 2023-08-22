require 'json'

class DataWriter
  attr_reader :data, :file_path

  def initialize(data, file_path)
    @data = data
    @file_path = file_path
  end

  def save_data
    File.write(@file_path, JSON.generate(@data))
    "Data saved to #{@file_path}"
  end
end

data = {
  "name": "Nicole Smith",
  "age": 25,
  "salary": 25552.67
}

file_path = 'data.json'
data_writer = DataWriter.new(data, file_path)
puts data_writer.save_data
