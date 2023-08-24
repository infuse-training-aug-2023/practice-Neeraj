require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'

driver = Selenium::WebDriver.for :chrome

driver.get 'https://computer-database.gatling.io/computers'

table = driver.find_element(css: 'table.computers')

rows = table.find_elements(css: 'tbody tr')

computer_names = []

rows.each do |row|
  columns = row.find_elements(tag_name: 'td')
  computer_name = columns[0].text
  computer_names << computer_name
end

computer_names.each do |name|
  puts name
end

driver.quit
