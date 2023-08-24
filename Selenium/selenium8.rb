require 'selenium-webdriver'

# Open Chrome Browser
Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.get 'https://www.globalsqa.com/demo-site/sliders/#Steps'

wait = Selenium::WebDriver::Wait.new(timeout: 20)

iframe = wait.until { driver.find_element(:css, '.demo-frame') }
driver.switch_to.frame(iframe)

parent_div = wait.until { driver.find_element(:id, '#slider') }

slider_handle = parent_div.find_element(:css, '.slider-handle.ui-slider-handle')

initial_amount = driver.find_element(:id, 'amount').attribute('value')

slider_handle.click

slider_handle.send_keys(:arrow_right)

wait.until do
  changed_amount = driver.find_element(:id, 'amount').attribute('value')
  changed_amount != initial_amount
end

changed_amount = driver.find_element(:id, 'amount').attribute('value')

puts "Initial Amount: #{initial_amount}"
puts "Changed Amount: #{changed_amount}"

driver.switch_to.default_content

driver.quit
