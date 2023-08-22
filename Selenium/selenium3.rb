require 'selenium-webdriver'

# Open Chrome Browser

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.get "https://www.saucedemo.com/v1/"
driver.manage.window.maximize

button = driver.find_element(:id , "login-button") 
username = driver.find_element(:id, "user-name")
password = driver.find_element(:id, "password")

username.send_keys("standard_user")
password.send_keys("secret_sauce")

button.click   # toggles dark and light mode

sleep 10

driver.quit