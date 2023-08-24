require 'selenium-webdriver'

# Open Chrome Browser
Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

# Navigate to a website
driver.get 'https://www.globalsqa.com/demo-site/sliders/#Steps'

# Define a wait with a maximum timeout of 20 seconds
wait = Selenium::WebDriver::Wait.new(timeout: 20)

# Switch to the iframe containing the slider
iframe = wait.until { driver.find_element(:css, '.demo-frame') }
driver.switch_to.frame(iframe)

# Wait for the parent div to be present
parent_div = wait.until { driver.find_element(:id, '#slider') }

# Find the slider handle within the parent div
slider_handle = parent_div.find_element(:css, '.slider-handle.ui-slider-handle')

initial_amount = driver.find_element(:id, 'amount').attribute('value')

# Click on the slider handle to focus it
slider_handle.click

# Send the right arrow key to move the slider
slider_handle.send_keys(:arrow_right)

# Wait for the amount to change
wait.until do
  changed_amount = driver.find_element(:id, 'amount').attribute('value')
  changed_amount != initial_amount
end

changed_amount = driver.find_element(:id, 'amount').attribute('value')

puts "Initial Amount: #{initial_amount}"
puts "Changed Amount: #{changed_amount}"

# Switch back to the main content
driver.switch_to.default_content

# Close the browser
driver.quit
