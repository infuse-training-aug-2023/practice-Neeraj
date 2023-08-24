require 'selenium-webdriver'

class WikipediaAutomation
  def initialize
    Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
    
    @driver = Selenium::WebDriver.for :chrome
    
    @driver.get 'https://en.wikipedia.org/wiki/Main_Page'
  end

  def search_and_click_result(search_query)
    search_input = @driver.find_element(id: 'searchInput')
    
    search_input.send_keys(search_query)
    
    @driver.execute_script("document.getElementById('searchInput').form.submit();")
    
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @driver.find_element(id: 'firstHeading') }
    
    search_result_link = @driver.find_element(css: '.mw-search-result-heading a')
    search_result_link.click
  end

  def extract_article_title
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @driver.find_element(id: 'firstHeading') }
    
    article_title = @driver.find_element(id: 'firstHeading').text
    article_title
  end

  def close_browser
    @driver.quit
  end
end

wikipedia_automation = WikipediaAutomation.new

wikipedia_automation.search_and_click_result('Selenium WebDriver')

article_title = wikipedia_automation.extract_article_title
puts "Title of the article: #{article_title}"

wikipedia_automation.close_browser
