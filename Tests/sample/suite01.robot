*** Settings ***
Documentation   sample github ci tests
Library     OperatingSystem
Library     SeleniumLibrary
Library     ../../Resources/UserKeyword/BrowserManager.py

# Suite Setup  Open Browser    url=${url}      browser=chrome   
# Suite Setup  start chrome with options




*** Variables ***
${url}       https://www.google.com
${cpath}     ${EXECDIR}/bin/chromedriver.exe

${newuser_name}
${newuser_rownum}

*** Test Cases ***
# Search Google01
#     open search engine
#     enter search term   juke box

# Search Google02
#     open search engine
#     enter search term   selenium

# Search Google03
#     open search engine
#     enter search term   selenium robot works
TC001
   Get some path
   start chrome with options
*** Keywords ***
Get some path
  
    ${path_exe}    get manager chrome path
    Log To Console   ${path_exe}
    Log To Console   ${cpath}


start chrome with options
    ${path_exe}    get manager chrome path
    Log To Console   ${path_exe}
    Append To Environment Variable    PATHV     ${EXECDIR}/bin/chromedriver.exe
    # Set Environment Variable  PATHV  '${path_exe}'
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --log-level\=3
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --window-size\=800,600
    Call Method    ${chrome_options}    add_argument    --remote-allow-origins\=*
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    
    @{service_args} =    Create List    --log-path=chromedriver.log   service=${path_exe}
    # Create WebDriver    Chrome    chrome_options=${chrome_options}    executable_path= ${cpath}     #service_args=@{service_args}
    Open Browser   url=${url}  browser=chrome   options=${chrome_options}   executable_path= ${cpath}
    Go To   ${url}


open search engine

    Set Browser Implicit Wait   20s
enter search term 
    [Arguments]   ${data}
    Input Text    name=q     ${data}\n  