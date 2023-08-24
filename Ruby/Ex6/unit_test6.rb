require 'test/unit'
require_relative 'ruby6'

class TestBase64Encoder < Test::Unit::TestCase
  def setup
    @input_file = 'input.txt'
    @output_file = 'Neeraj_yadav.txt'
    @base64_encoder = Base64Encoder.new(@input_file, @output_file)
  end
  
  def test_encode_and_replace_base64_string
    content = 'Originally... [ "the string that will be base encoded" ]. English law in 1852.'
    updated_content = @base64_encoder.encode_and_replace_base64_string(content)
    assert_equal 'Originally... [ "dGhlIHN0cmluZyB0aGF0IHdpbGwgYmUgYmFzZSBlbmNvZGVk" ]. English law in 1852.', updated_content
  end

  def test_write_to_output_file
    content = 'Originally, John Doe was a sham name used to indicate any plaintiff in an action of ejectment (a legal action to regain property) in civil court [ "the string that will be base encoded" ]. Richard Roe was the counterpart, to indicate the defendant. These fake names were used in delicate legal matters, a practice that was abolished in English law in 1852.'
    updated_content = @base64_encoder.encode_and_replace_base64_string(content)
    @base64_encoder.write_to_output_file(updated_content)
    output_content = File.read(@output_file)
    assert_equal updated_content, output_content.strip
  end
end
