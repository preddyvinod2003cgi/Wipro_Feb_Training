*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/locators.robot


*** Test Cases ***
Flight Booking Until Invoice Download

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    ${DEPARTURE_INPUT}

    Click Element    ${DEPARTURE_INPUT}
    Input Text       ${DEPARTURE_INPUT}    Bom
    Click Element    ${BOM_OPTION}

    Click Element    ${ARRIVAL_INPUT}
    Input Text       ${ARRIVAL_INPUT}    Del
    Click Element    ${DEL_OPTION}

    Click Element    ${ROUND_TRIP_DROPDOWN}
    Click Element    ${ROUND_TRIP_OPTION}

    Click Element    ${DEPARTURE_DATE}

    Click Element    ${RETURN_INPUT}
    Click Element    ${RETURN_DATE}

    Click Element    ${PASSENGER_BOX}
    Click Element    ${ADD_ADULT}

    Click Element    ${SEARCH_BUTTON}

    Wait Until Element Is Visible    ${BOOK_NOW}
    Click Element    ${BOOK_NOW}

    Wait Until Element Is Visible    ${FIRST_NAME}

    Input Text    ${FIRST_NAME}    Vinod
    Input Text    ${LAST_NAME}     Reddy
    Input Text    ${EMAIL}         vinod@gmail.com
    Input Text    ${PHONE}         9876543210

    Click Element    ${PAYMENT_BUTTON}

    Wait Until Element Is Visible    ${INVOICE_BUTTON}
    Click Element    ${INVOICE_BUTTON}

    Wait Until Element Is Visible    ${DOWNLOAD_INVOICE}
    Click Element    ${DOWNLOAD_INVOICE}

    Sleep    5

    Close Browser