*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Verify Switch Window
    Open Browser    ${url}    chrome
    Maximize Browser Window

    Wait Until Element Is Visible    id:openwindow    10s

    # Click Open Window button
    Click Button    id:openwindow
    Sleep    3s

    # Switch to new window
    Switch Window    NEW
    Sleep    2s

    # Verify new page loaded
    Page Should Contain    Rahul Shetty Academy

    # Switch back to main window
    Switch Window    MAIN
    Sleep    2s

    Close Browser