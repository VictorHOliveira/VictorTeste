*** Settings ***
Documentation  Controller and PageObjects about Product Page
Resource  ${ROOT}/resources/main.robot

*** Variables ***
&{productPage}
...  btn_addToWishList=wishlist_button
...  field_size=group_1
...  option_L=//*[@id="group_1"]/option[3]
...  btn_addToCart=add_to_cart
...  btn_continueShopping=//*[@id="layer_cart"]//div[4]/span

*** Keywords ***
add this item with size "L" to cart
    click on a search article
    Wait Until Element Is Visible    ${productPage.btn_addToWishList}      5s
    Scroll Element Into View         ${productPage.btn_addToWishList}
    Click Element                    ${productPage.field_size}
    Click Element                    ${productPage.option_L}
    Click Element                    ${productPage.btn_addToCart}
    Wait Until Element Is Visible    ${productPage.btn_continueShopping}   15s
    Click Element                    ${productPage.btn_continueShopping}
    Clear Element Text               ${homePage.input_searchBar}
    Take Screenshot
