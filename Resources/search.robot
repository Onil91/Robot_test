*** Variables ***
${TIMEOUT}                         10
${SEARCH_BAR}                      id:search_query_top
${SEARCH_BUTTON}                   name:submit_search
${NUMBER_OF_SEARCH_RESULT}         class:product-container
${RIGHT_SEARCH_RESULT}             xpath://*[@class='product_img_link' and contains(@title,'Printed')]

*** Keywords ***
Search for Product
    [Arguments]    ${SEARCH_TERM}
    Wait Until Element Is Visible   ${SEARCH_BAR}      ${TIMEOUT}
    Input Text    ${SEARCH_BAR}    ${SEARCH_TERM}
    Click Element    ${SEARCH_BUTTON}
Validating search results
    ${COUNT_1}    Get Element Count    ${NUMBER_OF_SEARCH_RESULT}
    ${COUNT_2}    Get Element Count    ${RIGHT_SEARCH_RESULT}
    Should Be Equal    ${COUNT_1}    ${COUNT_2}