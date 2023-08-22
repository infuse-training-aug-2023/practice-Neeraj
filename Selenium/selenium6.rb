require 'selenium-webdriver'

# Open Chrome Browser

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.get 'https://letcode.in/forms'

dropdown = driver.find_element(:xpath , '/html/body/app-root/app-forms/section[1]/div/div/div[1]/div/div/form/div[5]/div[2]/div/div/div/select')

options = dropdown.find_elements(tag_name: 'option')

options.each do |option|
  puts option.text
end

driver.quit