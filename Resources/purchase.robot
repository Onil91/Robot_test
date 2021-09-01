*** Variables ***
${TIMEOUT}                         10
${LOCATE_PRODUCT}                  xpath:/html/body/div[1]/div[2]/div/div[2]/div/div[1]/ul[1]/li[1]
${ADD_PRODUCT_TO_CART}             xpath://a[@class='button ajax_add_to_cart_button btn btn-default' and @data-id-product='1']
${PROCEED_TO_CHECKOUT_1}           xpath://a[@class='btn btn-default button button-medium'][@title='Proceed to checkout']
${PROCEED_TO_CHECKOUT_2}           xpath://a[@class='button btn btn-default standard-checkout button-medium'][@title='Proceed to checkout']
${PROCEED_TO_CHECKOUT_3}           xpath://button[@class='button btn btn-default button-medium'][@name='processAddress']
${PROCEED_TO_CHECKOUT_4}           xpath://button[@class='button btn btn-default standard-checkout button-medium'][@name='processCarrier']
${TERMS_OF_SERVICE}                xpath://*[@id="cgv"]
${BANK_WIRE}                       xpath:/html/body/div[1]/div[2]/div/div[3]/div/div/div[3]/div[1]/div/p/a
${CONFIRM_MY_ORDER}                xpath://button[@class='button btn btn-default button-medium']
${ORDER_INFO}                      xpath://div[@class='box'][1]
${ACCOUNT_PAGE}                    Class:account
${ORDERS}                          xpath:/html/body/div[1]/div[2]/div/div[3]/div/div/div[1]/ul/li[1]/a/span
${REFERENCE_NUMBER}                xpath://a[@class='color-myaccount']

*** Keywords ***
Add product to cart
    Wait Until Element Is Visible    ${LOCATE_PRODUCT}    ${TIMEOUT}
    Mouse Over    ${LOCATE_PRODUCT}
    Wait Until Element Is Visible    ${ADD_PRODUCT_TO_CART}    ${TIMEOUT}
    Click Element    ${ADD_PRODUCT_TO_CART}

Click Proceed to checkout
    Wait Until Element Is Visible    ${PROCEED_TO_CHECKOUT_1}    ${TIMEOUT}
    Click Element    ${PROCEED_TO_CHECKOUT_1}
    Wait Until Element Is Visible    ${PROCEED_TO_CHECKOUT_2}    ${TIMEOUT}
    Click Element    ${PROCEED_TO_CHECKOUT_2}
    Wait Until Element Is Visible    ${PROCEED_TO_CHECKOUT_3}    ${TIMEOUT}
    Click Element    ${PROCEED_TO_CHECKOUT_3}
    Wait Until Element Is Visible    ${PROCEED_TO_CHECKOUT_4}    ${TIMEOUT}
    Select Checkbox    ${TERMS_OF_SERVICE}
    Click Element    ${PROCEED_TO_CHECKOUT_4}

Click bank wire
    Wait Until Element Is Visible    ${BANK_WIRE}    ${TIMEOUT}
    Click Element    ${BANK_WIRE}

Click confirm my order
    Wait Until Element Is Visible    ${CONFIRM_MY_ORDER}    ${TIMEOUT}
    Click Element    ${CONFIRM_MY_ORDER}

Validating order confirmation
    Wait Until Element Is Visible    ${ORDER_INFO}    ${TIMEOUT}
    ${text_1}    Get Text    ${ORDER_INFO}
    ${PARSED_NUMBER}    Get Regexp Matches    ${text_1}    reference?\\s([A-Z]+)    1
    Click Element    ${ACCOUNT_PAGE}
    Wait Until Element Is Visible    ${ORDERS}    ${TIMEOUT}
    Click Element    ${ORDERS}
    ${text_2}    Catenate    SEPARATOR=    ${REFERENCE_NUMBER}    ${PARSED_NUMBER}
    Element Should Be Visible    ${text_2}