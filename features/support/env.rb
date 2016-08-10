#require 'Rspec'
require 'capybara'
require 'selenium-webdriver'
require 'cucumber'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'rspec/matchers'
require_relative 'app'
require File.dirname(__FILE__) + '/../lib/donorPath_helper'
require File.dirname(__FILE__) + '/../pages/referral_list'
require File.dirname(__FILE__) + '/../pages/notification'
require File.dirname(__FILE__) + '/../pages/search_archive'


include DonorPathHelper



Capybara.configure do |config|
  config.app_host = "https://www.amazon.co.uk"
  config.default_driver = :selenium
end


if ENV['DRIVER'] == 'chrome'
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
else
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
end



World(Capybara::DSL, AllPages)