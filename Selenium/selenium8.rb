require 'selenium-webdriver'

# Open Chrome Browser
Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

# Navigate to a website
driver.get 'https://www.globalsqa.com/demo-site/sliders/#Steps'

slider_handle = driver.find_element(class: 'ui-slider-handle')

initial_amount = driver.find_element(id: 'amount').attribute('value')

# Click on the slider handle to focus it
slider_handle.click

# Send the right arrow key to move the slider
slider_handle.send_keys(:arrow_right)

changed_amount = driver.find_element(id: 'amount').attribute('value')

puts "Initial Amount: #{initial_amount}"
puts "Changed Amount: #{changed_amount}"

# Close the browser
driver.quit
