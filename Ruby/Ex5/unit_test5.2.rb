require 'test/unit'
require_relative 'ruby5.2'

class TestDataUpdater < Test::Unit::TestCase
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

  def test_update_data_with_name_key
    data_updater = DataUpdater.new(@test_file_path)
    result = data_updater.update_data
  
    updated_data = {
      "first_name": "Nicole",
      "last_name": "Smith",
      "age": 25,
      "salary": 25552.67
    }
  
    expected_filename = "updated_data_#{Time.now.utc.strftime("%Y-%m-%d_%H-%M-%S")}.json"
  
    assert_equal "Data updated and saved to #{expected_filename}", result
  
    # Load both JSON strings as hashes and compare them
    expected_hash = JSON.parse(JSON.generate(updated_data), symbolize_names: true)
    actual_hash = JSON.parse(File.read(expected_filename), symbolize_names: true)
    assert_equal expected_hash, actual_hash

  end
  

  def test_update_data_without_name_key
    data = {
      "age": 25,
      "salary": 25552.67
    }
    File.write(@test_file_path, JSON.generate(data))

    data_updater = DataUpdater.new(@test_file_path)
    result = data_updater.update_data

    assert_equal "Data does not contain a :name key.", result
  end
end
