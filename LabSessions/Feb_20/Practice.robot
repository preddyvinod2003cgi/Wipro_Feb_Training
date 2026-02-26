*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://practice.automationtesting.in/
${BROWSER}    chrome

*** Test Cases ***
Complete Checkout Flow

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    20s
    Sleep    3s

    # REMOVE GOOGLE ADS
    Execute JavaScript    document.querySelectorAll("iframe[id^='aswift']").forEach(e => e.remove());
    Execute JavaScript    document.querySelectorAll("ins.adsbygoogle").forEach(e => e.remove());
    Sleep    2s

    # GO TO SHOP
    Click Link    Shop
    Sleep    3s

    # Remove ads again (Shop page loads ads too)
    Execute JavaScript    document.querySelectorAll("iframe[id^='aswift']").forEach(e => e.remove());
    Sleep    2s

    # ADD FIRST PRODUCT TO BASKET
    Scroll Element Into View    xpath=(//a[contains(text(),'Add to basket')])[1]
    Sleep    2s

    Execute JavaScript
    ...    document.querySelectorAll("a.add_to_cart_button")[0].click();
    Sleep    3s

    # CLICK VIEW BASKET (JS SAFE)
    Execute JavaScript
    ...    document.querySelector("a.added_to_cart").click();
    Sleep    3s

    # PROCEED TO CHECKOUT
    Click Element    xpath=//a[contains(text(),'Proceed to Checkout')]
    Sleep    4s

    # FILL BILLING DETAILS
    Input Text    id=billing_first_name    John
    Input Text    id=billing_last_name     Doe
    Input Text    id=billing_email         johndoe123@gmail.com
    Input Text    id=billing_phone         9876543210
    Input Text    id=billing_address_1     123 Street
    Input Text    id=billing_city          Bangalore
    Input Text    id=billing_postcode      560001

    # Select Country (Standard Dropdown)
    Select From List By Label    id=billing_country    India
    Sleep    2s

    # If state dropdown appears (optional)
    Run Keyword And Ignore Error    Select From List By Label    id=billing_state    Karnataka
    Sleep    2s

    # SELECT PAYMENT METHOD
    Scroll Element Into View    id=payment_method_cod
    Click Element    id=payment_method_cod
    Sleep    2s

    # PLACE ORDER
    # REMOVE OVERLAYS BEFORE PLACE ORDER
     Execute JavaScript    document.querySelectorAll("iframe[id^='aswift']").forEach(e => e.remove());
     Execute JavaScript    document.querySelectorAll("ins.adsbygoogle").forEach(e => e.remove());
     Execute JavaScript    document.querySelectorAll("[data-google-vignette]").forEach(e => e.remove());
     Sleep    2s

    # Scroll to Place Order
     Scroll Element Into View    id=place_order
     Sleep    2s

    # JS Click Place Order
     Execute JavaScript    document.getElementById("place_order").click();
     Sleep    5s

    # VERIFY CONFIRMATION
    Page Should Contain    Thank you. Your order has been received.
    Sleep    3s

    Close Browser