require 'selenium-webdriver'

# Open Chrome Browser

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.get 'https://cosmocode.io/automation-practice-webtable/'

header_row = driver.find_element(tag_name: 'tr')

headers = header_row.find_elements(tag_name: 'td')

headers.each do |headers|

  header_text = headers.find_element(tag_name: 'strong').text

  puts header_text

end

driver.quit