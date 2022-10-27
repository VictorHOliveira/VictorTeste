*** Settings ***
Documentation  Controller and PageObjects about Search Item
Resource  ${ROOT}/resources/main.robot

*** Variables ***
&{searchItemPage}
...  img_firstItem=//*[@id="center_column"]//li[1]/div

*** Keywords ***
wait the item is visible
    Wait Until Element Is Visible    ${searchItemPage.img_firstItem}  5s

click on a search article
    Click Element  ${searchItemPage.img_firstItem}