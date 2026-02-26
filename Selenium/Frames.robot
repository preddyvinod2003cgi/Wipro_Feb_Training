*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://jqueryui.com/datepicker/

*** Test Cases ***
Verify drop downs
    Open Browser    ${url}    chrome
    # maximize the browser window
    Maximize Browser Window
    Set Selenium Implicit Wait    3s
    Select Frame    xpath://iframe[@class='demo-frame']
    Sleep    2s
    Click Element    xpath://input[@id='datepicker']
    Sleep    2s
    Click Element    xpath://a[contains(text(),'21')]
    Close Browser