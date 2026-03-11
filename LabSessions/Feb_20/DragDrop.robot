*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.tutorialspoint.com/selenium/practice/droppable.php

*** Test Cases ***
Verify Drag And Drop In TutorialsPoint
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    3s
    Wait Until Element Is Visible    xpath://div[@id='draggable']
    Drag And Drop    xpath://div[@id='draggable']    xpath://div[@id='droppable']
    Sleep    2s
    Close Browser