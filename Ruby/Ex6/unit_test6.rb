require 'test/unit'
require_relative 'ruby6'

class TestBase64Encoder < Test::Unit::TestCase
  def setup
    @input_file = 'input.txt'
    @output_file = 'Neeraj_yadav.txt'
    @base64_encoder = Base64Encoder.new(@input_file, @output_file)
  end

  def teardown
    File.delete(@input_file) if File.exist?(@input_file)
    File.delete(@output_file) if File.exist?(@output_file)
  end

  def test_process_and_write_encoded_content_with_valid_input
    content = 'Originally... [ "the string that will be base encoded" ]. English law in 1852.'
    File.write(@input_file, content)

    result = @base64_encoder.process_and_write_encoded_content

    expected_encoded_content = 'Originally... [ "dGhlIHN0cmluZyB0aGF0IHdpbGwgYmUgYmFzZSBlbmNvZGVk" ]. English law in 1852.'
    assert_equal "Encoded content saved to #{@output_file}", result
    assert_equal expected_encoded_content, File.read(@output_file).strip
  end

  def test_process_and_write_encoded_content_with_invalid_input
    File.write(@input_file, 'Invalid input content')

    result = @base64_encoder.process_and_write_encoded_content

    assert_match(/^An error occurred: /, result)
    assert_false File.exist?(@output_file)
  end

  def test_process_and_write_encoded_content_with_missing_input_file
    result = @base64_encoder.process_and_write_encoded_content

    assert_match(/^An error occurred: /, result)
    assert_false File.exist?(@output_file)
  end
end
