*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections

*** Variables ***
${url}      https://www.tutorialspoint.com/selenium/practice/frames.php
*** Test Cases ***
Verify iframe
    Open Browser    ${url}      firefox
    Maximize Browser Window
    Set Selenium Implicit Wait    3s
    Select Frame    xpath://body//main//iframe[1]
    Sleep    2s
    ${text1}=       Get Text    xpath://body
    Sleep    2s
    Log To Console    Frame 1 Text:
    Log To Console    ${text1}
    Unselect Frame
    Select Frame    xpath://body//main//iframe[2]
    Sleep    2s
    ${text2}=       Get Text    xpath://body
    Sleep    2s
    Log To Console    Frame 2 Text:
    Log To Console    ${text2}
    Unselect Frame
    Close Browser
