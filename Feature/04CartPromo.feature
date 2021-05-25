@PromoCode @purple1
Feature: Cart Page Promocode Section

  Background: 
    Given User Launches the browser
    And User navigates to the Purple site

  @REP-662 @REP-2995
  Scenario Outline: 1 Verify user is able to view the promotion section
    Then user should able to add the product "<Product1>" from "<Category>"
    Then user should able to click on keep shopping button
    Then user should able to add the product "<Product2>" from "<Category>"
    Then user should able to click on view cart button
    Then user should able to land on Cart page
    Then user should able to view "Add Promo Code" link below order summary section
    Then user should able to click "Add Promo Code" link
    # Then user should be able to view "Promotions" section in cart page
    Then user should be able to view the promo code field with place holder as "Promo Code"
    And user should be able to enter a promocode in the field as <PromoCode>
      | InputFileName    | SheetName  |
      | Purple_DataSheet | Promocodes |
    Then user should be able to click on apply button
    And the offer should be applied Successfully

    Examples: 
      | PromoCode | Product1                       | Product2               | Category   |
      |         1 | Purple Hybrid premier Mattress | Purple Hybrid Mattress | Mattresses |

  @REP-1624
  Scenario Outline: 2 Verify user able to apply multiple promocode
    Then user should able to add the product "<Product1>" from "<Category>"
    Then user should able to click on keep shopping button
    Then user should able to add the product "<Product2>" from "<Category>"
    Then user should able to click on view cart button
    Then user should able to land on Cart page
    Then user should able to view "Add Promo Code" link below order summary section
    Then user should able to click "Add Promo Code" link
    And user should be able to enter a promocode in the field as <PromoCode>
      | InputFileName    | SheetName  |
      | Purple_DataSheet | Promocodes |
    Then user should be able to click on apply button
    Then user should able to click "Add Promo Code" link
    And user should be able to enter promocode in the field as "ABTESTING01"
    Then user should be able to click on apply button
    Then user should able to click "Add Promo Code" link
    And user should be able to enter promocode in the field as "ABTESTING02"
    Then user should be able to click on apply button
    Then user should be able to view the promo box with image, title and description

    Examples: 
      | PromoCode | Product1        | Product2               | Category   |
      |         3 | Purple Mattress | Purple Hybrid Mattress | Mattresses |

  Scenario Outline: 3 Verify if user is able to remove the added promo code
    Then user should able to add the product "<Product1>" from "<Category>"
    Then user should able to click on keep shopping button
    Then user should able to add the product "<Product2>" from "<Category>"
    Then user should able to click on view cart button
    Then user should able to land on Cart page
    Then user should able to click "Add Promo Code" link
    And user should be able to enter a promocode in the field as <PromoCode>
      | InputFileName    | SheetName  |
      | Purple_DataSheet | Promocodes |
    Then user should be able to click on apply button
    And the offer should be applied Successfully
    Then user should be able to click on the close button in the promo code
    Then the applied promo code should be removed
    And the dicount value should not be displayed in the cart

    Examples: 
      | PromoCode | Product1 | Product2   | Category   |
      |         1 | Platform | Foundation | Bed Frames |

  Scenario Outline: 4 Verify the behavior when user enters an invalid promo code
    Then user should able to add the product "<Product1>" from "<Category>"
    Then user should able to click on view cart button
    Then user should able to land on Cart page
    Then user should able to click "Add Promo Code" link
    And user should be able to enter promocode in the field as "ABC123s"
    Then user should be able to click on apply button
    Then user should be able to view the error message as "ABC123S is invalid or has expired"

    Examples: 
      | Product1   | Category   |
      | Foundation | Bed Frames |

  
  Scenario Outline: 5 Verify user able to view Message when promocode limit is reached
    Then user should able to add the product "<Product1>" from "<Category>"
    Then user should able to click on keep shopping button
    Then user should able to add the product "<Product2>" from "<Category>"
    Then user should able to click on view cart button
    Then user should able to land on Cart page
    Then user should able to click "Add Promo Code" link
    And user should be able to enter a promocode in the field as <PromoCode>
      | InputFileName    | SheetName  |
      | Purple_DataSheet | Promocodes |
    Then user should be able to click on apply button
    Then user should able to click "Add Promo Code" link
    And user should be able to enter promocode in the field as "ABTESTING01"
    Then user should be able to click on apply button
    Then user should able to click "Add Promo Code" link
    And user should be able to enter promocode in the field as "AUTOCODE01"
    Then user should be able to click on apply button
    Then user should able to click "Add Promo Code" link
    And user should be able to enter promocode in the field as "AUTOCODE01"
    Then user should be able to click on apply button
    Then user should be able to view the error message as "Promo code limit reached"

    Examples: 
      | PromoCode | Product1  | Product2   | Category   |
      |         3 | PowerBase | Foundation | Bed Frames |

  
  Scenario Outline: 6 Verify user able to view Message when promocode is not applicable to the cart
    Then user should able to add the product "<Product1>" from "<Category>"
    Then user should able to click on view cart button
    Then user should able to land on Cart page
    Then user should able to click "Add Promo Code" link
    And user should be able to enter a promocode in the field as <PromoCode>
      | InputFileName    | SheetName  |
      | Purple_DataSheet | Promocodes |
    Then user should be able to click on apply button
    Then user should be able to view the error message as "ABTESTING02 isn’t valid for the items in the cart"

    Examples: 
      | PromoCode | Product1         | Category |
      |         2 | Weighted Blanket | Bedding  |

  Scenario Outline: 7 Verify the ablility of the user to view the marketing content related to Affirm, if the cart is empty
    Then user should able to add the product "<Product1>" from "<Category>"
    Then user should able to click on view cart button
    Then user should able to land on Cart page
    Then user should remove the product from the cart to make it empty
    Then user should able to view splitit and affirm section in Cart page
    Then user should be able to view the Affrim Logo
    And user should be able to view a short decription
    And user should be able to view a Learn more link

    Examples: 
      | Product1       | Category |
      |  Weighted Blanket | Bedding  |

  Scenario Outline: 8 Verify is user is able to view the continue shopping button, if the cart is empty
    Then user should able to add the product "<Product1>" from "<Category>"
    Then user should able to click on view cart button
    Then user should able to land on Cart page
    Then user should remove the product from the cart to make it empty
    Then user should able to view splitit and affirm section in Cart page
    Then user should be able to view Continue shopping button under affirm marketing content
    Then user should be able to click on the Continue shopping button
    And user should be navigated to the previously accessed page

    Examples: 
      | Product1       | Category |
      | Foundation | Bed Frames |
