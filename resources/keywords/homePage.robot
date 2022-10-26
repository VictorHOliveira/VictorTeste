*** Settings ***
Documentation
Resource  ${ROOT}/resources/main.robot
Library    SeleniumLibrary

*** Variables ***
&{homePage}
...  bannerTop=//*[@id="header"]/div[1]//img

*** Keywords ***
the top banner is visible
    Wait Until Element Is Visible  ${homePage.bannerTop}