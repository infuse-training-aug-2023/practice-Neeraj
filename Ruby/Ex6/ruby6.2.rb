require 'base64'

original_string = 'the string that will be base encoded'
encoded_string = Base64.encode64(original_string)

File.write('encoded_string.txt', encoded_string)

puts "Encoded string saved to 'encoded_string.txt'"