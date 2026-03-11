*** Variables ***

${URL}    https://phptravels.net/flights
${BROWSER}    chrome

${DEPARTURE_INPUT}    xpath://input[@placeholder='Departure City or Airport']
${ARRIVAL_INPUT}      xpath://input[@id='arrival_airport_input']

${BOM_OPTION}    xpath://div[contains(text(),'Mumbai')]
${DEL_OPTION}    xpath://span[contains(text(),'DEL')]

${ROUND_TRIP_DROPDOWN}    xpath:/html/body/section/div[2]/div/div/form/div[3]/div[1]/div/div/div/span[2]
${ROUND_TRIP_OPTION}      xpath://span[normalize-space()='Round Trip']

${DEPARTURE_DATE}    xpath://td/div[text()='11']
${RETURN_INPUT}      xpath://input[@placeholder='Return Date']
${RETURN_DATE}       xpath:(//td/div[text()='16'])[2]

${PASSENGER_BOX}    xpath:/html/body/section/div[2]/div/div/form/div[3]/div[2]/div[1]/div[1]
${ADD_ADULT}        xpath:/html/body/section/div[2]/div/div/form/div[3]/div[2]/div[1]/div[2]/div[1]/div[2]/button[2]

${SEARCH_BUTTON}    xpath://button[contains(.,'Search Flights')]
${BOOK_NOW}         xpath:(//button[contains(.,'Book Now')])[2]

${FIRST_NAME}       xpath://input[@name='firstname']
${LAST_NAME}        xpath://input[@name='lastname']
${EMAIL}            xpath://input[@name='email']
${PHONE}            xpath://input[@name='phone']

${PAYMENT_BUTTON}   xpath://button[contains(.,'Confirm Booking')]
${INVOICE_BUTTON}   xpath://a[contains(.,'Invoice')]
${DOWNLOAD_INVOICE}    xpath://a[contains(@href,'invoice')]