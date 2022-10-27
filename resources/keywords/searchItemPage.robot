*** Settings ***
Documentation
Resource  ${ROOT}/resources/main.robot
Library    SeleniumLibrary

*** Variables ***
&{searchItemPage}
...  img_firstItem=//*[@id="center_column"]//li[1]/div

*** Keywords ***
wait the item is visible
    Wait Until Element Is Visible    ${searchItemPage.img_firstItem}
    Sleep  3s
    Clear Element Text    ${homePage.input_searchBar}