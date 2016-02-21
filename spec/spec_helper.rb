require 'rspec'
require 'page-object'
require 'require_all'
require_rel '../features/support/pages'

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before :all do
    @browser = Selenium::WebDriver.for :firefox
  end
  config.after :all do
    @browser.quit
  end
end