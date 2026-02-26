*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${url}    https://www.amazon.in/

*** Test Cases ***
Verify radio buttons
    Open Browser    ${url}    chrome
    # maximize the browser window
    Maximize Browser Window
    # wait till the element is loaded
    Sleep    3s
    Wait Until Element Is Visible    xpath://a[normalize-space()='Sell']
    Open Context Menu    link=sell
    Sleep    2s
    # double click
    Double Click Element    xpath://a[normalize-space()='Mobiles']
    Sleep    2s
    # close browser
    Close Browser