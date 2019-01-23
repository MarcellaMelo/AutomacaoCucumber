require 'capybara/cucumber'
require 'selenium-webdriver'
Before do
    Selenium::WebDriver::Chrome.driver_path="C:/Users/Rafael/Desktop/chromedriver_win32/chromedriver.exe"
        $driver=Selenium::WebDriver.for(:chrome) 
  end
require 'site_prism'
require_relative 'helper.rb'
require_relative 'page_helper.rb'

AMBIENTE = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")
World(Helper)
World(Pages)


Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = CONFIG['url_padrao']
    config.default_max_wait_time = 10
end