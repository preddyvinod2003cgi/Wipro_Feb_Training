*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php

*** Test Cases ***
Verify Drop Downs

    Open Browser    ${URL}    chrome
    Maximize Browser Window

    Wait Until Element Is Visible    id=state

    # Get currently selected state
    @{labels}=    Get Selected List Labels    id=state
    Log    ${labels}

    # Select state by visible text
    Select From List By Label    id=state    Uttar Pradesh
    Sleep    3s

    # Wait for city dropdown to be enabled
    Wait Until Element Is Enabled    id=city

    # Select city by index
    Select From List By Index    id=city    2
    Sleep    3s

    Close Browser