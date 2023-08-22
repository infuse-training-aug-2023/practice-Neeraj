require 'selenium-webdriver'

# Open Chrome Browser

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.get "https://google.com"

input = driver.find_element(:id, "APjFqb")

input.send_keys("Hello World!")

input.send_keys(:enter)

sleep 2

driver.quit