*** Settings ***
Documentation   sample github ci tests
Library     SeleniumLibrary
Library     ../../Resources/UserKeyword/BrowserManager.py

# Suite Setup  Open Browser    url=${url}      browser=chrome   
# Suite Setup  start chrome with options




*** Variables ***
${url}       https://www.google.com
${newuser_name}
${newuser_rownum}

*** Test Cases ***

TC001
   Get some path

Search Google01
    start chrome with options
    open search engine
    enter search term   juke box

Search Google02
    open search engine
    enter search term   selenium

Search Google03
    open search engine
    enter search term   selenium robot works


*** Keywords ***
Get some path
    ${path_exe}    get manager chrome path
    Log To Console   ${path_exe}


start chrome with options
    ${path_exe}    get manager chrome path
    Log To Console   ${path_exe}
    # ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    # Call Method    ${chrome_options}    add_argument    --log-level\=3
    # Call Method    ${chrome_options}    add_argument    --start-maximized
    # Call Method    ${chrome_options}    add_argument    --window-size\=800,600
    # Call Method    ${chrome_options}    add_argument    --remote-allow-origins\=*
    # Call Method    ${chrome_options}    add_argument    --disable-notifications
    # Call Method    ${chrome_options}    add_argument    --disable-infobars
    # Call Method    ${chrome_options}    add_argument    --headless
    # Call Method    ${chrome_options}    add_argument    --disable-extensions
    # #Create WebDriver    Chrome    chrome_options=${chrome_options} 
    # @{service_args} =    Create List    --log-path=chromedriver.log   

    Open Browser   browser=firefox   
    Go To   ${url}


open search engine

    Set Browser Implicit Wait   20s
enter search term 
    [Arguments]   ${data}
    Input Text    name=q     ${data}\n  