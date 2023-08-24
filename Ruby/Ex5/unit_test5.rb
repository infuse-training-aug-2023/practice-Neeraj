require 'test/unit'
require_relative 'ruby5'

class TestDataManipulator < Test::Unit::TestCase
  def setup
    @test_file_path = 'test_data.json'
    data = {
      "name": "Nicole Smith",
      "age": 25,
      "salary": 25552.67
    }
    File.write(@test_file_path, JSON.generate(data))
  end

  def teardown
    File.delete(@test_file_path) if File.exist?(@test_file_path)
  end

  def test_load_data_with_valid_file
    data_manipulator = DataManipulator.new(@test_file_path)
    loaded_data = data_manipulator.load_data

    expected_data = {
      name: "Nicole Smith",
      age: 25,
      salary: 25552.67
    }

    assert_equal expected_data, loaded_data
  end

  def test_load_data_with_invalid_json
    File.write(@test_file_path, 'Invalid JSON data')

    data_manipulator = DataManipulator.new(@test_file_path)
    loaded_data = data_manipulator.load_data

    assert_nil loaded_data
  end

  def test_load_data_with_nonexistent_file
    data_manipulator = DataManipulator.new('nonexistent.json')
    loaded_data = data_manipulator.load_data

    assert_nil loaded_data
  end

  def test_update_data_with_valid_data
    data_manipulator = DataManipulator.new(@test_file_path)
    result = data_manipulator.update_data
  
    assert_match(/^Data updated and saved to .*\.json$/, result)
  
    updated_file_path = result.scan(/Data updated and saved to (.+\.json)$/).flatten.first
    updated_data = JSON.parse(File.read(updated_file_path), symbolize_names: true)
  
    expected_updated_data = {
      first_name: "Nicole",
      last_name: "Smith",
      age: 25,
      salary: 25552.67
    }
  
    assert_equal expected_updated_data, updated_data
  end

  def test_update_data_with_invalid_data
    File.write(@test_file_path, 'Invalid JSON data')

    data_manipulator = DataManipulator.new(@test_file_path)
    result = data_manipulator.update_data

    assert_equal "File doesn't exist or contains invalid JSON data.", result
  end
end
