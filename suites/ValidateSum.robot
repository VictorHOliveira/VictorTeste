*** Settings ***
Documentation  Teste
Resource  ${ROOT}/resources/main.robot
Suite Setup  Open Browsers
Suite Teardown  Close Browser

*** Test Cases ***
TC-001 - Validation sum of articles
    Given search in a search bar for a dress
    And add this item with size "L" to cart
    And search in a search bar for a t-shirt
    And add this item with size "L" to cart
    When I proceed to checkout
    Then I validate if te sum of this items is correct