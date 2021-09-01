*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${TIMEOUT}                         10
${SELECT_POPULAR}                  Class:homefeatured
${ITEM_NAME}                       xpath:/html/body/div[1]/div[2]/div/div[2]/div/div[1]/ul[1]/li[1]/div/div[2]/h5/a
${ITEM_PRICE}                      xpath:/html/body/div[1]/div[2]/div/div[2]/div/div[1]/ul[1]/li[1]/div/div[2]/div[1]/span
${CONTINUE_SHOPPING}               xpath://span[@class='continue btn btn-default button exclusive-medium'][@title='Continue shopping']
${SUCCESSFUL_ITEM}                 xpath:/html/body/div[1]/div[1]/header/div[3]/div/div/div[4]/div[1]/div[1]/h2
${SHOPPING_CART}                   xpath:/html/body/div[1]/div[2]/div/div[1]/span[2]
${SHOPPING_CART_COUNT}             xpath:/html/body/div[1]/div[1]/header/div[3]/div/div/div[3]/div/a/span[1]
${SHOPPING_CART_BUTTON}            xpath://a[@href="http://automationpractice.com/index.php?controller=order"]
${SHOPPING_CART_PAGE_COUNT}        xpath:/html/body/div[1]/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[5]/input[2]
${SHOPPING_CART_PAGE_NAME}         xpath:/html/body/div[1]/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[2]/p/a
${SHOPPING_CART_PAGE_PRICE}        xpath:/html/body/div[1]/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[4]/span/span
${SHOPPING_CART_PAGE_TOTAL_PRICE}  xpath://*[@id="total_price"]
${DECREASE_ITEM}                   xpath://a[@class="cart_quantity_down btn btn-default button-minus"]
${EMPTYING_CART}                   xpath://a[@class="cart_quantity_delete"]
${CART_IS_EMPTY_WARNING}           xpath://span[@class='ajax_cart_no_product']

*** Keywords ***
Click popular
    Wait Until Element Is Visible    ${SELECT_POPULAR}    ${TIMEOUT}
    Click Element    ${SELECT_POPULAR}

Add multiple products to cart
    [Arguments]    ${ITEM_NUMBER_VAR}
    ${ITEM_NUMBER_VAR}    Evaluate    ${ITEM_NUMBER_VAR} + 1
    FOR    ${counter}    IN RANGE    1    ${ITEM_NUMBER_VAR}
        Wait Until Element Is Visible    ${LOCATE_PRODUCT}    ${TIMEOUT}
        Mouse Over    ${LOCATE_PRODUCT}
        Wait Until Element Is Visible    ${ADD_PRODUCT_TO_CART}    ${TIMEOUT}
        Click Element    ${ADD_PRODUCT_TO_CART}
        Wait Until Element Is Visible    ${CONTINUE_SHOPPING}    ${TIMEOUT}
        Click Element    ${CONTINUE_SHOPPING}
    END
    ${SHOPPING_CART_COUNT_VAR}    Get Text    ${SHOPPING_CART_COUNT}
    Should Be Equal As Numbers    ${SHOPPING_CART_COUNT_VAR}    ${counter}
    ${SHOPPING_CART_COUNT_VAR}    Set Variable    0

Validating shopping cart
    Wait Until Element Is Visible    ${SHOPPING_CART_BUTTON}    ${TIMEOUT}
    ${ITEM_NAME_VAR}    Get Text    ${ITEM_NAME}
    ${ITEM_PRACE_VAR}    Get Text    ${ITEM_PRICE}
    ${SHOPPING_CART_COUNT_VAR}    Get Text    ${SHOPPING_CART_COUNT}
    Click Link    ${SHOPPING_CART_BUTTON}
    Wait Until Element Is Visible    ${SHOPPING_CART}    ${TIMEOUT}
    ${SHOPPING_CART_PAGE_COUNT_VAR}    Get Value    ${SHOPPING_CART_PAGE_COUNT}
    ${SHOPPING_CART_PAGE_NAME_VAR}    Get Text    ${SHOPPING_CART_PAGE_NAME}
    ${SHOPPING_CART_PAGE_PRICE_VAR}    Get Text    ${SHOPPING_CART_PAGE_PRICE}
    Should Be Equal As Strings    ${ITEM_NAME_VAR}    ${SHOPPING_CART_PAGE_NAME_VAR}
    Should Be Equal As Strings    ${ITEM_PRACE_VAR}    ${SHOPPING_CART_PAGE_PRICE_VAR}
    Should Be Equal    ${SHOPPING_CART_COUNT_VAR}    ${SHOPPING_CART_PAGE_COUNT_VAR}

Shopping cart total price
    Wait Until Element Is Visible    ${SHOPPING_CART_PAGE_TOTAL_PRICE}    ${TIMEOUT}
    ${SHOPPING_CART_PAGE_TOTAL_PRICE_VAR_BEFORE}    Get Text    ${SHOPPING_CART_PAGE_TOTAL_PRICE}
    [Return]    ${SHOPPING_CART_PAGE_TOTAL_PRICE_VAR_BEFORE}

Decrease item
    Wait Until Element Is Visible    ${DECREASE_ITEM}    ${TIMEOUT}
    Click Element    ${DECREASE_ITEM}
    Sleep    6

Shopping cart total price updated
    [Arguments]    ${temp}
    ${SHOPPING_CART_PAGE_TOTAL_PRICE_VAR_BEFORE}    Remove String    ${temp}    $
    Wait Until Element Is Visible   ${SHOPPING_CART_PAGE_TOTAL_PRICE}      ${TIMEOUT}
    ${temp}    Get Text    ${SHOPPING_CART_PAGE_TOTAL_PRICE}
    ${SHOPPING_CART_PAGE_TOTAL_PRICE_VAR_AFTER}    Remove String    ${temp}    $
    ${temp}    Get Text    ${SHOPPING_CART_PAGE_PRICE}
    ${SHOPPING_CART_PAGE_PRICE_VAR}    Remove String    ${temp}    $
    ${PRICE_DIFF}    Evaluate    ${SHOPPING_CART_PAGE_TOTAL_PRICE_VAR_BEFORE} - ${SHOPPING_CART_PAGE_TOTAL_PRICE_VAR_AFTER}
    Should Be Equal As Numbers    ${SHOPPING_CART_PAGE_PRICE_VAR}    ${PRICE_DIFF}

Emptying cart
    Wait Until Element Is Visible   ${EMPTYING_CART}    ${TIMEOUT}
    Click Element    ${EMPTYING_CART}
    Wait Until Element Is Visible    ${CART_IS_EMPTY_WARNING}    ${TIMEOUT}
    Page Should Contain Element    ${CART_IS_EMPTY_WARNING}
