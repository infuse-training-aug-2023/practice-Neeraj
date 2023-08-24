require 'selenium-webdriver'

# Open Chrome Browser

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize
driver.get 'https://infuse.it'

title = driver.title

puts "Website title : #{title}" 
driver.quit