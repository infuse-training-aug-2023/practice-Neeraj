require 'selenium-webdriver'

# Open Chrome Browser
Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.get 'https://letcode.in/forms'

dropdown_element = driver.find_element(:xpath, '/html/body/app-root/app-forms/section[1]/div/div/div[1]/div/div/form/div[5]/div[2]/div/div/div/select')

dropdown = Selenium::WebDriver::Support::Select.new(dropdown_element)

# Get all options and print their text
dropdown.options.each do |option|
  puts option.text
end

driver.quit
