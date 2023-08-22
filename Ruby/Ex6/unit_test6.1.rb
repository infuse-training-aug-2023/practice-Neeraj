require 'test/unit'
require_relative 'runy6.1'

class TestReadFile < Test::Unit::TestCase
  def setup
    @test_file_path = 'test_input.txt'
    @test_content = "This is a test content."
    File.write(@test_file_path, @test_content)
  end

  def teardown
    File.delete(@test_file_path) if File.exist?(@test_file_path)
  end

  def test_read_content_from_file
    output = `ruby read_file.rb`
    assert_equal "Content read from the file:\n#{@test_content}\n", output
  end
end
