*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.tutorialspoint.com/selenium/practice/check-box.php

*** Test Cases ***
Verify Main Level Checkboxes
    Open Browser    ${url}    chrome
    # maximize the browser window
    Maximize Browser Window

    # wait till Main Level 1 is visible
    Wait Until Element Is Visible    xpath://label[text()='Main Level 1']

    # click on Main Level 1
    Click Element    xpath://input[@id='c_bs_1']

    # click on Main Level 2
    Click Element    xpath://input[@id='c_bs_2']

    # close browser
    Close Browser
