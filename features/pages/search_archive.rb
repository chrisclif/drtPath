require 'capybara'
require 'capybara/dsl'
require 'rspec/matchers'
require File.dirname(__FILE__) + '/../lib/donorPath_helper'


class SearchArchive


  include DonorPathHelper
  include Capybara::DSL
  include RSpec::Matchers


  def page_url
    @@plp_page = (current_url)
    p @@plp_page + ("current page is #{title}")
  end

  def verify_page_url
    expect(page.current_url).to include("field-keywords=")
  end

  def add_Item_to_basket(quantity, size) # method is specific specific for adding PHONE to basket
    page.find('#quantity').select(quantity)
    sleep 2
    page.find("#variation_size_name li[title='Click to select #{size}']").click
    page.find(:button, 'Add to Basket').click
  end


  def verify_search_result(matching_result)    #single used method ... should be reviewed
    click_link(matching_result)
    expect(page.has_content?('Apple iPhone 5S 16GB Unlocked')).to eql true
    item_page_back_button = page.find('#breadcrumb-back-link')
    if item_page_back_button.visible?
      puts "Now in the item result page"
    else
      puts "item page not displayed"
    end
  end

  def select_result(clickText_on_resultScreen)
    click_on(clickText_on_resultScreen)
  end


end