*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}   standard_user
${PASSWORD}   secret_sauce

*** Test Cases ***
Complete Purchase Flow
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Slow down execution
    Set Selenium Speed    0.5 seconds

    # Login
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button  id=login-button

    # Add item to cart
    Wait Until Element Is Visible    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Element   class=shopping_cart_link

    # Checkout
    Click Button    id=checkout
    Input Text    id=first-name    Vijay datta
    Input Text    id=last-name     paramkusham
    Input Text    id=postal-code   500001
    Click Button   id=continue

    # Finish
    Click Button   id=finish

    # Verify order
    Wait Until Page Contains    Thank you for your order!

    Close Browser