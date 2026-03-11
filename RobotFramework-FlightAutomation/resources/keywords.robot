*** Settings ***
Library    SeleniumLibrary
Variables  locators.robot
*** Keywords ***

Select Departure City
    [Arguments]    ${city}
    Click Element    ${DEPARTURE_CITY}
    Input Text    xpath=//input[@type='search']    ${city}
    Press Keys    xpath=//input[@type='search']    ENTER

Select Arrival City
    [Arguments]    ${city}
    Click Element    ${ARRIVAL_CITY}
    Input Text    xpath=//input[@type='search']    ${city}
    Press Keys    xpath=//input[@type='search']    ENTER