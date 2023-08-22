require 'selenium-webdriver'

# Set the path to the ChromeDriver executable
Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'

# Create a new instance of the WebDriver using Chrome
driver = Selenium::WebDriver.for :chrome

# Navigate to the Wikipedia website
driver.get 'https://en.wikipedia.org/wiki/Main_Page'

# Find the search input element
search_input = driver.find_element(id: 'searchInput')

# Type in a search query (e.g., "Selenium WebDriver")
search_input.send_keys('Selenium WebDriver')

# Submit the search form using JavaScript
driver.execute_script("document.getElementById('searchInput').form.submit();")

# Wait for search results to load
wait = Selenium::WebDriver::Wait.new(timeout: 10)
wait.until { driver.find_element(id: 'firstHeading') }

# Click on the search result link
search_result_link = driver.find_element(css: '.mw-search-result-heading a')
search_result_link.click

# Extract the title of the article
article_title = driver.find_element(id: 'firstHeading').text

puts "Title of the article: #{article_title}"

# Close the browser
driver.quit
