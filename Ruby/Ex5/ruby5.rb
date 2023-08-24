require 'json'

class DataManipulator
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def save_data(data)
    File.write(@file_path, JSON.generate(data))
    "Data saved to #{@file_path}"
  end

  def load_data
    if File.exist?(@file_path)
      json_data = File.read(@file_path)
      begin
        JSON.parse(json_data, symbolize_names: true)
      rescue JSON::ParserError
        nil # Return nil if the file content is not in valid JSON format
      end
    else
      nil # Return nil if the file doesn't exist
    end
  end

  def update_data
    loaded_data = load_data
    return "File doesn't exist or contains invalid JSON data." unless loaded_data

    if loaded_data.key?(:name)
      first_name, last_name = loaded_data[:name].split(' ')
      loaded_data[:first_name] = first_name
      loaded_data[:last_name] = last_name
      loaded_data.delete(:name)

      updated_json_data = JSON.pretty_generate(loaded_data)
      timestamp = Time.now.utc.strftime("%Y-%m-%d_%H-%M-%S")
      new_filename = "NeerajYadav#{timestamp}.json"
      File.write(new_filename, updated_json_data)
      "Data updated and saved to #{new_filename}"
    else
      "Data does not contain a :name key."
    end
  end
end
