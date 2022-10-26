*** Settings ***
Documentation  Teste
Resource  ${ROOT}/resources/main.robot
Suite Setup  Open Browsers
Suite Teardown  Close Browser

*** Test Cases ***
TC-001 - Teste Victor
    Given Teste de Log