*** Settings ***
Library    SeleniumLibrary
Resource    Resources/registration.robot
Resource    Resources/search.robot
Resource    Resources/cart.robot
Resource    Resources/purchase.robot
*** Variables ***
${URL}    http://automationpractice.com
${RETURN_TO_HOME_PAGE}             xpath://img[@class="logo img-responsive"]
*** Keywords ***
Create All Webdriver
    [Documentation]    Create All Webdriver for supported browser
    [Arguments]    ${browser}
    Run Keyword If    '${browser}'=='FF'    Create Webdriver    Firefox    executable_path=geckodriver.exe
    Run Keyword If    '${browser}'=='Chrome'    Create Webdriver    Chrome    executable_path=chromedriver.exe    
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window

Return to home Page
    [Documentation]    Return to home Page
    Wait Until Element Is Visible    ${RETURN_TO_HOME_PAGE}    ${TIMEOUT}
    Click Element    ${RETURN_TO_HOME_PAGE}