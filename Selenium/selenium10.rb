require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'

driver = Selenium::WebDriver.for :chrome

driver.get 'https://computer-database.gatling.io/computers'

target_column_header_text = "Computer name"

header_row = driver.find_element(css: 'thead tr')

target_column_index = header_row.find_elements(tag_name: 'th').find_index do |header_cell|
  header_cell.text == target_column_header_text
end

table_body = driver.find_element(css: 'tbody')

rows = table_body.find_elements(tag_name: 'tr')

column_values = []

rows.each do |row|
  cells = row.find_elements(tag_name: 'td')
  cell_text = cells[target_column_index].text
  column_values << cell_text
end

column_values.each do |value|
  puts value
end

driver.quit
