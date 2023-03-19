*** Settings ***
Documentation   sample github ci tests
Library     SeleniumLibrary
Library     ../../Resources/UserKeyword/BrowserManager.py

# Suite Setup  Open Browser    url=${url}      browser=chrome   
Suite Setup  start chrome with options




*** Variables ***
${url}       https://www.google.com
${newuser_name}
${newuser_rownum}

*** Test Cases ***
Search Google01
    open search engine
    enter search term   juke box

Search Google02
    open search engine
    enter search term   selenium

Search Google03
    open search engine
    enter search term   selenium robot works


*** Keywords ***

start chrome with options
    
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --log-level\=3
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --window-size\=800,600
    Call Method    ${chrome_options}     add_argument    --remote-allow-origins\=*
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Create WebDriver    Chrome    chrome_options=${chrome_options} 
    Go To   ${url}


open search engine

    Set Browser Implicit Wait   20s
enter search term 
    [Arguments]   ${data}
    Input Text    name=q     ${data}\n  