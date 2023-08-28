require 'json'
require 'faker'

def generate_fake_data(num_entries)
  data = []

  num_entries.times do
    entry = {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      age: rand(18..80),
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.phone_number,
      gender: Faker::Gender.binary_type,
      hobbies: Faker::Lorem.words(number: rand(1..5))
    }
    data << entry
  end

  data
end

def main
  # Command-line argument for number of entries
  if ARGV.length != 1
    puts "Usage: ruby script.rb <num_entries>"
    exit 1
  end

  num_entries = ARGV[0].to_i

  fake_data = generate_fake_data(num_entries)
  puts JSON.pretty_generate(fake_data)
end

main
