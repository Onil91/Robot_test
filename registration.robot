*** Variables ***
${TIMEOUT}                         10
${SIGN_IN_BUTTON}                  class:login
${EMAIL_FIELD}                     id:email_create
${Create_new_account_button}       id:SubmitCreate
${FIRST_NAME_FIELD}                id:customer_firstname
${LAST_NAME_FIELD}                 id:customer_lastname
${PASSWORD_FIELD}                  id:passwd
${ADDRESS_FIELD}                   id:address1
${CITY_FIELD}                      id:city
${MOBILE_FIELD}                    id:phone_mobile
${ZIP_CODE_FIELD}                  id:postcode
${STATE_FIELD}                     id:id_state
${REGISTER_BUTTON}                 id:submitAccount
${LOGOUT_VISIBLE}                  class:logout
${MY_ACCOUNT_VISIBLE}              xpath://span[@class='navigation_page']["My account"]


*** Keywords ***
Click sign in
    Wait Until Element Is Visible    ${SIGN_IN_BUTTON}    ${TIMEOUT}
    Click Element    ${SIGN_IN_BUTTON}
    
Fill in random email address
    ${ran int}    Generate random string    5    0123456789
    ${login_data}    Catenate    SEPARATOR=    test    ${ran int}    @test.com
    Wait Until Element Is Visible    ${EMAIL_FIELD}    ${TIMEOUT}
    Input Text    ${EMAIL_FIELD}    ${login_data}

Click create an account
    Wait Until Element Is Visible    ${Create_new_account_button}    ${TIMEOUT}
    Click Element    ${Create_new_account_button}

Fill in first name
    [Arguments]  ${FIRST_NAME}
    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}    ${TIMEOUT}
    Input Text    ${FIRST_NAME_FIELD}    ${FIRST_NAME}

Fill in last name
    [Arguments]  ${LAST_NAME}
    Wait Until Element Is Visible    ${LAST_NAME_FIELD}    ${TIMEOUT}
    Input Text    ${LAST_NAME_FIELD}    ${LAST_NAME}

Fill in password
    [Arguments]  ${PASSWORD}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    ${TIMEOUT}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}

Fill in address
    [Arguments]  ${ADDRESS}
    Wait Until Element Is Visible    ${ADDRESS_FIELD}     ${TIMEOUT}
    Input Text    ${ADDRESS_FIELD}    ${ADDRESS}
    
Fill in city
    [Arguments]  ${CITY}
    Wait Until Element Is Visible    ${CITY_FIELD}     ${TIMEOUT}
    Input Text    ${CITY_FIELD}    ${CITY}

Fill in mobile
    [Arguments]  ${MOBILE}
    Wait Until Element Is Visible    ${MOBILE_FIELD}     ${TIMEOUT}
    Input Text    ${MOBILE_FIELD}    ${MOBILE}

Fill in zip code
    [Arguments]  ${ZIP_CODE}
    Wait Until Element Is Visible    ${ZIP_CODE_FIELD}     ${TIMEOUT}
    Input Text    ${ZIP_CODE_FIELD}    ${ZIP_CODE}

Fill in state
    [Arguments]  ${STATE}
    Select From List By Value    ${STATE_FIELD}    ${STATE}

Click register
    Wait Until Element Is Visible    ${REGISTER_BUTTON}    ${TIMEOUT}
    Click Element    ${REGISTER_BUTTON}

Validating successful registration
    Wait Until Element Is Visible    ${LOGOUT_VISIBLE}    ${TIMEOUT}
    Element Should Be Visible    ${MY_ACCOUNT_VISIBLE}
