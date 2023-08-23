require 'base64'

class Base64Encoder
  attr_accessor :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def process_and_write_encoded_content
    begin
      content = read_input_file
      updated_content = encode_and_replace_base64_string(content)
      write_to_output_file(updated_content)
      "Encoded content saved to #{@output_file}"
    rescue StandardError => e
      "An error occurred: #{e.message}"
    end
  end

  private

  def read_input_file
    File.read(@input_file)
  end

  def encode_and_replace_base64_string(content)
    base64_string = extract_base64_string(content)
    encoded_string = encode_to_base64(base64_string)
    content.gsub("[ \"#{base64_string}\" ]", "[ \"#{encoded_string}\" ]")
  end

  def write_to_output_file(updated_content)
    File.open(@output_file, 'w') { |file| file.write(updated_content) }
  end

  def extract_base64_string(content)
    content.match(/\[ "(.*?)" \]/)[1]
  end

  def encode_to_base64(string)
    Base64.strict_encode64(string)
  end
end
