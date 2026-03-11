*** Settings ***
# setting we add the external library details, resources, set up and tear down commands
Library    SeleniumLibrary


*** Variables ***
# A scalar variable can only contain one value - $
# A list variable can contain multiple values @
# A dictionary variable can contain multiple key-value pairs - &

${name}        John
${city}        Hyderabad
${address}     St Peters Road
@{list1}       green    red    blue
@{list2}       apple    banana    grapes
&{creds}       username=admin    password=admin123


*** Test Cases ***
Verify the variables
    Log    ${name}
    Log    ${city}
    Log    ${address}

    FOR    ${element}    IN    @{list1}
        Log    ${element}
    END

    FOR    ${element}    IN    @{list2}
        Log    ${element}
    END

    Log    ${list1}[0]
    Log    ${list1}[1]
    Log    ${creds}[username]
