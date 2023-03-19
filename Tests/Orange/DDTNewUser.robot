*** Settings ***
Documentation   This is

Library    SeleniumLibrary
Library    DebugLibrary
Library    ../../CustomKeywords/CustomLib.py
Variables  ../../PageObject/orange_locators/page01_loc.py

Suite Setup  Open Browser    url=${url}      browser=chrome   

*** Variables ***
${url}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${timeout}   25s
${newuser_name}
${newuser_rownum}

*** Test Cases ***
Create New User
    Login to Orange    Admin    admin123
    go to admin page
    go to user management page
    logout out frome Orange HRM
    
    
 

*** Keywords ***

Login to Orange
    [Arguments]    ${username}     ${password}
    ${var_digit}   Get Random Digits   4
    Log To Console   RandomDigit:  ${var_digit}
    Wait Until Element Is Visible        ${usernameEle}       ${timeout}
    Input Text         ${usernameEle}    ${username}
    Input Text         ${passwordEle}    ${password}
    Click Element      ${submitBTNEle} 
    Wait Until Element Is Visible    ${pageHeadingEle}    ${timeout}

go to admin page
    Wait Until Element Is Visible    ${adminMenuEle}    ${timeout}
    Log To Console  click on admin
    Click Element    ${adminMenuEle}
    Sleep  5s

go to user management page
    ${adminTitle}    Get Text    ${pageHeadingEle}
    Log To Console  ${adminTitle}
    
    ${dynamicName}  Create List  Alpa  beta  Min  Max  Tom  Riz  Ham  Fox
    ${autoList}  Create List  A  J  E  C  B  D

    FOR  ${index}  IN RANGE  10
       
       Log To Console  iteration: ${index}
       ${userNameValue}=  Evaluate  random.choice(${dynamicName})  random
       ${autoName}=  Evaluate  random.choice(${autoList})  random
      
       Log To Console  random username and dynamic emp name: ${userNameValue} ${autoName}


       ${greenBTNS}    Get WebElements    ${buttons}
       Log To Console  click on add button
       Click Element   ${greenBTNS}[1]
       Sleep  7s
    
       #enter select values
       Wait Until Element Is Visible    ${pageTextEle}    ${timeout}
       ${adminTitle}     Get Text   ${pageTextEle}
       Log To Console   Page Title: ${adminTitle}
    
       @{selectElements}   Get WebElements   ${selectEle}
       ${userRole}    Get WebElement     ${selectElements}[0]    
       ${userStatus}    Get WebElement     ${selectElements}[1]
    
       Element Text Should Be    ${pageTextEle}     Admin
       Run Keyword If   '${adminTitle}' == 'Admin'
       ...         Run Keywords
       ...         Click Element     ${userRole}
       ...         AND   Sleep  1s
       ...         AND   Click Element    xpath://*[contains(text(),'Admin')]
       ...         AND   Sleep  1s
       ...         AND   Click Element  ${userStatus}
       ...         AND   Sleep  1s
       ...         AND   Click Element    xpath://*[contains(text(),'Enabled')]
   
       #Input username,password and employee_name
    
       ${var_digit}   Get Random Digits   4
       Log To Console   RandomDigit:  ${var_digit}
       Set Suite Variable   ${newuser_name}     ${userNameValue}${var_digit}
       @{userInputBox}   Get WebElements   ${userInputBoxEle}
    
       ${userName}      Get WebElement     ${userInputBox}[1]
       ${userpass1}      Get WebElement    ${userInputBox}[2]
       ${userpass2}      Get WebElement    ${userInputBox}[3]

       ${adminTitle}     Get Text   ${pageTextEle}
       Log To Console   Page Title: ${adminTitle}
       Sleep  2s
    
       Input Text    ${userName}     ${newuser_name}
       Input Text    ${userpass1}   Test@1234
       Input Text    ${userpass2}   Test@1234  
       Sleep  2s   
   
    #    ${empName}    Get WebElement    ${empInputBoxEle}
    #    Input Text   ${empName}   ${autoName}
    #    Sleep  2s
    #    Execute Javascript     arguments[0].value = ''       ARGUMENTS    ${empName}
    #    Sleep  2s
   
       ${empName}    Get WebElement    ${empInputBoxEle}
       Input Text   ${empName}   ${autoName}
       Sleep  4s
       ${listBox}   Get WebElement   ${dynamicListEle}
   
       ${status}    Run Keyword And Return Status    Element Should Be Visible       ${listBox}
       Log To Console   ${status} 
       ${stat}    Convert To String    ${status}
   
       Run Keyword If  ${status}
       ...         Run Keyword
       ...         Log To Console   dynamic list found
   
       ${listBox}     Get WebElements     xpath://div[contains(@class,'oxd-autocomplete-dropdown --positon-bottom')]/div
       ${optionListText}    Get Text    ${listBox}[1]
       Log To Console  Employee name list displayed: ${optionListText}
       Click Element      ${listBox}[1]
       Sleep  2s
       
       #click add user save button
       Log To Console  Accesing Test Variable: ${newuser_name}
       Click Button   ${saveBTN}
       Sleep   5s
    END







logout out frome Orange HRM
    ${usr_profile}    Get WebElement    xpath://span[@class='oxd-userdropdown-tab']
    Click Element     ${usr_profile}
    Sleep   1s
    Element Should Be Visible   xpath://ul[@class='oxd-dropdown-menu']/li[4]     logout should be visible
    Click Element     xpath://ul[@class='oxd-dropdown-menu']/li[4]




