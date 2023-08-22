require 'selenium-webdriver'

# Open Chrome Browser

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.get "https://demo.automationtesting.in/Register.html"

my_radio = driver.find_element(:css , "input[type='radio'][name='radiooptions'][value='Male']")
my_checkbox = driver.find_element(css: "input[type='checkbox'][id='checkbox1']")

my_radio.click
my_checkbox.click

sleep 2

driver.quit