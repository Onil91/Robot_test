*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    keywords.robot
Suite Setup    Create All Webdriver    ${browser}
Suite Teardown    Close All Browsers


*** Test Cases ***
Successful registration
    [Tags]    registration
    Click sign in
    Fill in random email address
    Click create an account
    Fill in first name    etc
    Fill in last name    etc
    Fill in password    12345
    Fill in address    Street
    Fill in city    NY
    Fill in mobile    +00000000000
    Fill in zip code    00000
    Fill in state    1
    Click register
    Validating successful registration

Searching for products
    [Tags]    search
    Return to home Page
    Search for Product    Printed
    Validating search results

Add products to cart
    [Tags]    cart
    Return to home Page
    Click popular
    Add multiple products to cart    2
    Validating shopping cart


Delete products from cart
    [Tags]    cart
    Return to home Page
    Add multiple products to cart    2
    Validating shopping cart
    ${SHOPPING_CART_PAGE_TOTAL_PRICE_VAR}    Shopping cart total price
    Decrease item
    Shopping cart total price updated    ${SHOPPING_CART_PAGE_TOTAL_PRICE_VAR}
    Emptying cart

Purchase products with bank wire
    [Tags]    purchase
    Return to home Page
    Add product to cart
    Click Proceed to checkout
    Click bank wire
    Click confirm my order
    Validating order confirmation
