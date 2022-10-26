*** Settings ***
Documentation  Keywords to start the sessions of test and helpers keywords.
Resource  ${ROOT}/resources/main.robot

*** Keywords ***
### SCREENSHOT HELPER ###
Define o diretório para as evidências
    [Documentation]  Extrai a tag do test, cria o diretório com
    ...              o nome da tag e então define esse diretório para salvar os Screenshots.
    FOR  ${tag}  IN  @{TEST TAGS}
        ${isTC}  Run Keyword And Return Status  Should Contain  ${tag}  TC
        IF  ${isTC} == True
            ${TEST_ID}  Set Variable  ${tag}
            Exit For Loop
        END
    END
    ${EVIDENCIA_PATH}  Set Variable  ${ROOT}\\Results\\${CURRENT_TIME}\\screenshots\\${TEST_ID}
    Create Directory  ${EVIDENCIA_PATH}
    Set Test Variable  ${EVIDENCIA_PATH}
    Log To Console  ENVIDENCIAS PATH: ${EVIDENCIA_PATH}

Take Screenshot
    [Documentation]  Captura a tela do device em ".png", renomeia com a data e hora em que foi feita a Captura
    ...              e salva no diretório com nome do teste.
    ${SCREENSHOT_NAME}  Get Current Date  result_format=%d%m%y_%H%M%S
    Capture Page Screenshot  ${EVIDENCIA_PATH}\\${SCREENSHOT_NAME}.png

### KEYWORD PARA WAIT E CLICK NO ELEMENTO ESPERADO ###
Wait And Click Element
    [Arguments]  ${Waiting_Element}  ${time_out}=15s
    Wait Until Element Is Visible  ${Waiting_Element}  ${time_out}
    Click Element  ${Waiting_Element}

### KEYWORD PARA AGUARDAR O ELEMENTO E INPUTAR UM TEXTO ###
Wait And Input Text
    [Arguments]  ${Element}  ${Texto}  ${Timeout}=15s
    Wait Until Element Is Visible  ${Element}  ${Timeout}
    Input Text  ${Element}  ${Texto} 

for to keywords page DOWN
    FOR  ${i}  IN RANGE  2
    Press Keys    None    PAGE_DOWN
    END

for to keywords page UP
    FOR  ${i}  IN RANGE  2
    Press Keys    None    PAGE_UP
    END

Get text via javascript by ID
  [Arguments]  ${ID}
  ${TEXT} =  Execute Javascript  return document.getElementById('${ID}').value
  [Return]  ${TEXT}

Capturar uma imagem e salvar com o nome do teste
    ${Tag}=  Get From List  ${TEST TAGS}  -1    
    Capture Page Screenshot  ${Tag}.png

scroll página
    [Documentation]  Essa Keyword permite que você role a página para baixo ou para cima 
    ...  Informando os pixels negativos rola para cima e positivos rola para baixo
    [Arguments]  ${Pixels}
    ${comando}=  Replace String   window.scrollTo(0, window.scrollY+(pixels))  pixels  ${Pixels} 
    Execute Javascript        ${comando}

Get date by subtracting '${DAYS}' days from current date
  ${DATETIME} =  Get Current Date
  ${DATE} =     Convert Date  ${DATETIME}  datetime
  ${SUBTRACTED_DATE} =  Subtract Time From Date  ${DATE}  ${DAYS} days
  ${SUBTRACTED_DATE} =  Convert Date  ${SUBTRACTED_DATE}  result_format=%d%m%Y
  [Return]  ${SUBTRACTED_DATE}

Get date by adding '${DAYS}' days from current date
  ${DATETIME} =  Get Current Date
  ${DATE} =  Convert Date  ${DATETIME}  datetime
  ${ADDED_DATE} =  Add Time To Date  ${DATE}  ${DAYS} days
  ${ADDED_DATE} =  Convert Date  ${ADDED_DATE}  result_format=%d%m%Y
  [Return]  ${ADDED_DATE}

Disable switch
  [Arguments]  ${SWT}  ${CHK}
  Wait Until Element Is Visible    ${SWT}
  ${SWT_STATUS} =  Run Keyword And Return Status  Checkbox Should Be Selected  ${CHK}
  Run Keyword If  '${SWT_STATUS}'=='True'  Click Element  ${SWT}

Select Button
  [Arguments]  ${BTN}
  Wait Until Element Is Visible    ${BTN}    10s
  Sleep  2s
  Click Element   ${BTN} 

Enable switch
  [Arguments]  ${SWT}  ${CHK}
  Wait Until Element Is Visible    ${SWT}    
  ${SWT_STATUS} =  Run Keyword And Return Status  Checkbox Should Not Be Selected    ${CHK}
  IF  '${SWT_STATUS}'=='True'  
      Wait And Click Element  ${SWT}  10
  ELSE
      Wait And Click Element  ${SWT}  10
  END

voltar para a tela anterior
  Go Back

Button IsDisplayed
  [Arguments]     ${BTN}
  Wait Until Page Contains    ${BTN}    10s
  Wait Until Element Is Visible  ${BTN}
  Wait Until Element Is Enabled    ${BTN}    