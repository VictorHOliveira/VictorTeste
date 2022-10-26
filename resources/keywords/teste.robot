*** Settings ***
Documentation
Resource  ${ROOT}/resources/main.robot
Library    SeleniumLibrary

*** Variables ***
&{analise_de_tempo_medio}
...  IPT_PERIODO=(//label[text()='Periodo :']//following::input[@class='select-dropdown'])[1]
...  OPT_TYPE=//span[text()='type']

*** Keywords ***
Teste de Log
    Click Element  ${analise_de_tempo_medio.IPT_PERIODO}