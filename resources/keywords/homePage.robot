*** Settings ***
Documentation  Controller and PageObjects about Home Page
Resource  ${ROOT}/resources/main.robot

*** Variables ***
&{homePage}
...  bannerTop=//*[@id="header"]/div[1]//img
...  input_searchBar=search_query_top
...  btn_search=//*[@id="searchbox"]/button
...  txt_dresses=//*[@id="block_top_menu"]/ul/li[2]/a
...  btn_cart=//*[@id="header"]//div[3]/div/a

*** Keywords ***
the top banner is visible
    Wait Until Element Is Visible  ${homePage.bannerTop}  2s

search in a search bar for a ${item}
    Wait Until Element Is Visible  ${homePage.bannerTop}  2s
    Input Text  ${homePage.input_searchBar}  ${item}
    Click Element  ${homePage.btn_search}
    wait the item is visible
    Take Screenshot

I proceed to checkout
    Click Element  ${homePage.btn_cart}
    
