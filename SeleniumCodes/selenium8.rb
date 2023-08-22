require 'selenium-webdriver'

# Open Chrome Browser

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

# Navigate to a website
driver.get 'https://www.globalsqa.com/demo-site/sliders/#Steps'

slider_handle = driver.find_element(class: 'ui-slider-handle')

initial_amount = driver.find_element(id: 'amount').attribute('value')

move_distance = slider_handle.size.width * 0.5

action_builder = driver.action

action_builder.click_and_hold(slider_handle)
              .move_by_offset(move_distance, 0)
              .release
              .perform

changed_amount = driver.find_element(id: 'amount').attribute('value')

puts "Initial Amount: #{initial_amount}"
puts "Changed Amount: #{changed_amount}"

# Close the browser
driver.quit