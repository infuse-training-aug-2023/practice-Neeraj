require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

driver.get "https://www.globalsqa.com/demo-site/sliders/#Steps"

driver.switch_to.frame driver.find_element(:xpath, "/html/body/div/div[1]/div[2]/div/div/div[2]/div/div/div[3]/p/iframe")

slider = driver.find_element(:id, "slider")

slider_pointer = slider.find_element(:tag_name, "span")
slider_value = driver.find_element(:id, "amount")

slider_pointer.send_keys(:right)
slider_pointer.send_keys(:right)

puts slider_value.attribute("value")

driver.quit