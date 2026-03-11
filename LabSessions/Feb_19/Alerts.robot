*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              https://www.tutorialspoint.com/selenium/practice/alerts.php
*** Test Cases ***
Verify Alerts

        Open Browser        ${url}      chrome
        #maximize the window
        Maximize Browser Window
        Wait Until Element Is Visible       xpath:(//button)[6]

        #Simple alert - accecpt is for ok
        Click Element    xpath:(//button)[6]
        Handle Alert    action=ACCEPT       timeout=3
        Sleep    5s

        #confirmational alert - accept is for ok, dismiss is for cancel
        Click Element    xpath:(//button)[8]
        Handle Alert    action=DISMISS      timeout=3
        Sleep    5s

        #Prompt alert - accept is for ok, dismiss is for cancel
        Click Element    xpath:(//button)[9]
        Input Text Into Alert   vinod
                Sleep    5s

        #close browser
        Close Browser