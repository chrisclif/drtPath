require File.dirname(__FILE__) + '/../pages/authentication'

include DonorPathHelper
include Capybara::DSL
include RSpec::Matchers


# Steps for texts on product description page
Given(/^i am on the home screen$/) do
  from_homePage
end

When(/^i search for "([^"]*)"$/) do |item_searched|
  searchFor(item_searched)
end

And(/^i choose "([^"]*)" from the results$/) do |result_selected|
  amazon.plp.select_result(result_selected)
end

And(/^i am on the product description page$/) do
  amazon.plp.page_url
end

Then(/^i should see the following texts on screen$/) do |table|
  expect(page.has_content?(table)).to eql true
end


#STEPS FOR JEST SCENARIOS

Given(/^i am on the automateWebsite$/) do
  visit "http://automatetillinfinity.co.uk/"
  page.driver.browser.manage.window.maximize
end

 When(/^i click on all the tabs$/) do
   home_ttab = HomeTab.new

   home_ttab.home_tab.click

 trade_tab.click
 book_tab.click
 just_tab.click
 about_tab.click
 contact_tab.click
  # click_tab('#homeTab')
  # click_tab('#tradeYourJetTab')
  # click_tab('#bookYourJetTab')
  # click_tab('#justTradeTab')
  # click_tab('#aboutUsTab')
  # click_tab('#contactSupportTab')
end

Then(/^i will end up in the contact support page$/) do
  expect(page.has_content?('Contact Support')).to eql true

end


# case switch vs if statement   - When handling
