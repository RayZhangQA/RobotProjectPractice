*** Settings ***
Library     SeleniumLibrary

Suite Setup        Log    I am inside Test Suite Setup
Suite Teardown     Log    I am inside Test Suite Teardown
Test Setup         Log    I am inside Test Setup
Test Teardown      Log    I am inside Test Teardown

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    HI am in First Test...
    
MySecondTest
    Log    I am in Second Test...
    Set Tags    regression1
    
MyThirdTest
    Log    I am in Third Test...
    
MyFirstSeleniumTest
#    Create WebDriver    Chrome    Executable_path = "C:/webdrivers/chromedriver.exe"
    Open Browser    https://google.com    Chrome
    Set Browser Implicit Wait     5
    Input Text      name = q      Automation step by step
    Press Keys      name = q      ENTER
    Sleep           2
    Close Browser
    Log             Test Completed
    
SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser    ${URL}    Chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element     id = welcome
    Click Element     link = Logout
    Close Browser
    Log               Test completed
    Log               This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123


*** Keywords ***
LoginKW
    Input Text        id = txtUsername    ${CREDENTIALS}[0]
    Input Password    id = txtPassword    ${LOGINDATA}[password]
    Click Button      id = btnLogin
    
    