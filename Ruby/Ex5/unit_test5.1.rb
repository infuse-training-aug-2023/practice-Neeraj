require 'test/unit'
require_relative 'ruby5.1'

class TestDataWriter < Test::Unit::TestCase
  def test_save_data
    data = {
      "name": "Nicole Smith",
      "age": 25,
      "salary": 25552.67
    }
    file_path = 'test_data.json'

    data_writer = DataWriter.new(data, file_path)
    result = data_writer.save_data

    assert_equal "Data saved to #{file_path}", result
    assert_equal JSON.generate(data), File.read(file_path)
  ensure
    File.delete(file_path) if File.exist?(file_path)
  end
end
