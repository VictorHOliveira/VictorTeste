*** Settings ***
Documentation  Keywords for suite/test setup and suite/test teardown
Resource  ${ROOT}/resources/main.robot
Library    SeleniumLibrary

*** Keywords ***
# SETUP
Open Browsers
    Open Browser  http://automationpractice.com/  chrome  options=add_experimental_option('excludeSwitches',['enable-logging'])
    Maximize Browser Window
    Set Selenium Speed  1

# TEARDOWNS
Close Browser
  Close All Browsers