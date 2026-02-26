*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Verify Switch Tab
    Open Browser    ${url}    chrome
    Maximize Browser Window

    Wait Until Element Is Visible    id:opentab    15s

    Click Element    id:opentab
    Sleep    3s

    Switch Window    NEW
    Page Should Contain    Rahul Shetty Academy
    Sleep    2s

    Switch Window    MAIN
    Sleep    2s

    Close Browser