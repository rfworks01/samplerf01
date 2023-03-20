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
open chrome when using create driver
    start chrome with options
    open search engine
    enter search term   juke box

open chrome when using open browser
     open chrome using open browser
     open search engine
     enter search term   selenium

open firefox when using open browser
     open firefox using open browser
     open search engine
     enter search term   selenium robot works
# TC001
#    Get some path
#    start chrome with options
*** Keywords ***
Get some path
  
    ${path_exe}    get manager chrome path
    Log To Console   ${path_exe}
    Log To Console   ${cpath}


start chrome with options
    # ${path_exe}    get manager chrome path
    # Log To Console   ${path_exe}
    # Append To Environment Variable    PATHV     ${EXECDIR}/bin/chromedriver.exe
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
    
    # @{service_args} =    Create List    --log-path=chromedriver.log   service=${path_exe}
    Create WebDriver    Chrome    chrome_options=${chrome_options}    executable_path=E:/Selenium-3.6/chrome111/chromedriver.exe    #service_args=@{service_args}
    Go To   ${url}


open chrome using open browser
    ${path_exe}    get manager chrome path
    Log To Console   ${path_exe}
    Log To Console   ${cpath}
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --log-level\=3
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --window-size\=800,600
    Call Method    ${chrome_options}    add_argument    --remote-allow-origins\=*
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Open Browser   url=${url}  browser=chrome   options=${chrome_options}   executable_path=${path_exe}

open firefox using open browser
   ${ff_path}   get manager firefox path
   Log To Console  ${ff_path}
   Open Browser   url=${url}  browser=headlessfirefox    executable_path=${ff_path}
   Sleep  6s




open search engine
    Set Browser Implicit Wait   20s
enter search term 
    [Arguments]   ${data}
    Input Text    name=q     ${data}\n
    Sleep  3s