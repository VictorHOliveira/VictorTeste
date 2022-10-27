*** Settings ***
Documentation  Keywords for help the project
Resource  ${ROOT}/resources/main.robot

*** Keywords ***
### SCREENSHOT HELPER ###
Sets the directory for the evidence
    [Documentation]  Extract the test tag, create the directory with the tag name
    ...              and then define this directory to save the Screenshots.
    FOR  ${tag}  IN  @{TEST TAGS}
        ${isTC}  Run Keyword And Return Status  Should Contain  ${tag}  TC
        IF  ${isTC} == True
            ${TEST_ID}  Set Variable  ${tag}
            Exit For Loop
        END
    END
    ${EVIDENCE_PATH}  Set Variable  ${ROOT}\\Results\\${CURRENT_TIME}\\screenshots\\${TEST_ID}
    Create Directory  ${EVIDENCE_PATH}
    Set Test Variable  ${EVIDENCE_PATH}
    # Log To Console  ENVIDENCIAS PATH: ${EVIDENCE_PATH}

Take Screenshot
    [Documentation]  Capture the device's screen in ".png", rename it with the date
    ...              and time the Capture was made and save it in the directory with the test name.
    Sets the directory for the evidence
    ${SCREENSHOT_NAME}  Get Current Date  result_format=%d%m%y_%H%M%S
    Capture Page Screenshot  ${EVIDENCE_PATH}\\${SCREENSHOT_NAME}.png