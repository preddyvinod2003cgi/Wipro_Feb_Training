*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Verify radio buttons
    Open Browser    ${url}    chrome
    # maximize the browser window
    Maximize Browser Window
    # wait till the element is loaded

    Wait Until Element Is Visible    xpath://input[@value = 'radio1']
    # click on radio button
    Click Element    xpath://input[@value = 'radio1']
    # click on check box 3
    Click Element    id=checkBoxOption3
    # close browser
    Close Browser
