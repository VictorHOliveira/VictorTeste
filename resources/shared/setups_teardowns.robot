*** Settings ***
Documentation  Keywords utilizadas em setups e teardowns dos testes/suites.
Resource  ${ROOT}/resources/main.robot
Library    SeleniumLibrary

*** Keywords ***
# SETUP
Open Browsers
    Open Browser  http://automationpractice.com/  chrome  options=add_experimental_option('excludeSwitches',['enable-logging'])
    Maximize Browser Window

# TEARDOWNS
Close Browser
  Close All Browsers