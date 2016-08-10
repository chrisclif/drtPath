require 'capybara'
require 'capybara/dsl'

class Bbb
  include DonorPathHelper
  include Capybara::DSL
  include RSpec::Matchers


  # using these variables throws an error "undefined local variable or method `page' for AmazonHelper:Module (NameError)"

   def aaaa
    home_tab=page.find('#homeTab')
    trade_tab=page.find('#tradeYourJetTab')
    book_tab=page.find('#bookYourJetTab')
    just_tab=page.find('#justTradeTab')
    about_tab=page.find('#aboutUsTab')
    contact_tab=page.find('#contactSupportTab')

    end





end