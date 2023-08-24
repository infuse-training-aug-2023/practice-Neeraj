require 'base64'

class Base64Encoder
  attr_accessor :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def read_input_file
    File.read(input_file)
  end

  def encode_and_replace_base64_string(content)
    encoded_string = extract_base64_string(content)
    content.gsub(/\[ "#{encoded_string}" \]/, "[ \"#{encode_to_base64(encoded_string)}\" ]")
  end

  def write_to_output_file(updated_content)
    File.open(output_file, 'w') { |file| file.write(updated_content) }
  end

  private

  def extract_base64_string(content)
    content.match(/\[ "(.*?)" \]/)[1]
  end

  def encode_to_base64(string)
    Base64.strict_encode64(string)
  end
end
