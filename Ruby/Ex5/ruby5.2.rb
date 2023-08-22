require 'json'

class DataUpdater
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def update_data
    json_data = File.read(@file_path)
    data = JSON.parse(json_data, symbolize_names: true)

    if data.key?(:name)
      first_name, last_name = data[:name].split(' ')
      data[:first_name] = first_name
      data[:last_name] = last_name
      data.delete(:name)

      updated_json_data = JSON.pretty_generate(data)
      timestamp = Time.now.utc.strftime("%Y-%m-%d_%H-%M-%S")
      new_filename = "updated_data_#{timestamp}.json"
      File.write(new_filename, updated_json_data)
      "Data updated and saved to #{new_filename}"
    else
      "Data does not contain a :name key."
    end
  end
end

file_path = 'data.json'
data_updater = DataUpdater.new(file_path)
puts data_updater.update_data
