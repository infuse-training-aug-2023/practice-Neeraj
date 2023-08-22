# write_file.rb

encoded_string = File.read('encoded_string.txt')

file_name = 'Neeraj_yadav.txt'
File.write(file_name, encoded_string)

puts "Encoded string written to #{file_name}"
