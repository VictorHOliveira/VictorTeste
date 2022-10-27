*** Settings ***
Documentation
Resource  ${ROOT}/resources/main.robot
Library    SeleniumLibrary

*** Variables ***
&{homePage}
...  bannerTop=//*[@id="header"]/div[1]//img
...  input_searchBar=search_query_top
...  btn_search=//*[@id="searchbox"]/button
...  txt_dresses=//*[@id="block_top_menu"]/ul/li[2]/a

*** Keywords ***
the top banner is visible
    Wait Until Element Is Visible  ${homePage.bannerTop}

search in a search bar for a ${item}
    Wait Until Element Is Visible  ${homePage.bannerTop}
    Input Text  ${homePage.input_searchBar}  ${item}
    Click Element  ${homePage.btn_search}
    wait the item is visible
    Sleep  3s
    
