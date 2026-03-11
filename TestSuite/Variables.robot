*** Settings ***
Library    SeleniumLibrary


*** Variables ***



${name}   John
${city}   Hyderabad
${address}   St Peters Road
${list1}   green   red   blue
${list2}   apple   banana   grapes
${creds}   username=admin   password=admin123


*** Test Cases ***
Verify the variables
    Log    ${name}
    Log    ${city}
    Log    ${address}
