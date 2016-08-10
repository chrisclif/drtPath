Feature: search for items
  in order to buy available products
  as a user
  i should be able to search for any item

  @search
  Scenario: Add an iPhone5 to the basket
    Given i have searched for an item
    And item is available for purchase
    When i add item to my shopping basket
    Then only expected number of items will be in my basket

  @search
  Scenario Outline: as a user i want to be able to perform a search
    Given that the page have successful loaded the amazon page
    When i search for an "<item_searched>"
    Then the "<item_result>" should  displayed
    Examples:
      | item_searched        | item_result                        |
      | beats solo headphone | results for "beats solo headphone" |
      | lg ultra hd 4k tv    | results for "lg ultra hd 4k tv"    |
      | fitbit surge         | results for "fitbit surge"         |


  # @navigate,@search
  @nowNOW
  Scenario Outline: texts on product description page
    Given i am on the home screen
    When i search for "<item_searched>"
    And i choose "<result_selected>" from the results
    And i am on the product description page
    Then i should see the following texts on screen
      | left in stock              |
      | Estimated delivery         |
      | Frequently Bought Together |
      | Roll over image to zoom in |
    Examples:
      | item_searched  | result_selected           |
      | Asus Zen Watch | Asus ZenWatch Smart Watch |

  @now
  Scenario: as a user i want to click all tabs
    Given i am on the automateWebsite
    When i click on all the tabs
    Then i will end up in the contact support page

