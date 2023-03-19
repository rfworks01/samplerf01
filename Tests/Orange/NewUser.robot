*** Settings ***
Documentation   This is

Resource   ../master_loader.robot
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
    enter select values 
    Input username,password and employee_name
    click add user save button
    new user should exist in admin data table
    logout out frome Orange HRM
    Login to Orange     ${newuser_name}   Test@1234
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

    ${greenBTNS}    Get WebElements    ${buttons}
    Log To Console  click on add button
    Click Element   ${greenBTNS}[1]
    Sleep  7s

enter select values
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
   
Input username,password and employee_name
    
    ${var_digit}   Get Random Digits   4
    Log To Console   RandomDigit:  ${var_digit}
    Set Suite Variable   ${newuser_name}     Alpa${var_digit}
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
   
    ${empName}    Get WebElement    ${empInputBoxEle}
    Input Text   ${empName}   Jo
    Sleep  2s
    Execute Javascript     arguments[0].value = ''       ARGUMENTS    ${empName}
    Sleep  2s
   
    ${empName}    Get WebElement    ${empInputBoxEle}
    Input Text   ${empName}   Jo
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
   
click add user save button
   Log To Console  Accesing Test Variable: ${newuser_name}
   Click Button   ${saveBTN}
   Sleep   5s

click cancel button
   Log To Console  Accesing Test Variable: ${newuser_name}
   Click Button   ${caneclBTN}
   Sleep   5s


new user should exist in admin data table
   Sleep   7s
   ${tableEle}    Get WebElement    xpath://div[@class='oxd-table']
   
   ${total_rows}     Get WebElements   xpath://div[@class='oxd-table']//div[@role='row']
   ${total_columns}  Get WebElements   xpath://div[@class='oxd-table-body']/div[1]/div/div
   
   ${rows}     Get Length   ${total_rows}
   ${columns}  Get Length   ${total_columns}

   FOR  ${row}  IN RANGE   ${rows}-1
        ${textRow}   Evaluate  ${row}+1
        ${userNameColText}    Get Text  xpath://div[@class='oxd-table-body']/div[${textRow}]/div/div[2]         # ${colText} = 'Dominic.Chase'  
        Log To Console        ${userNameColText}
   END
   
   Log To Console  Search username in table rows and get row num
   ${userRowNUm}=   Run Keyword  get user row from user table    ${total_rows}    xpath://div[@class='oxd-table-body']/div[%s]/div/div[2]   ${newuser_name}
   Log To Console  username found at row num: ${userRowNUm}
   Set Test Variable   ${newuser_rownum}   ${userRowNUm}

get user row from user table 
   [Documentation]   get table data
   ...  col start from index=1  row start from index=1
   ...  xpath_string_with_columnum: xpath is modified according to row num
   ...  some values      
   [Arguments]   ${rowWebelements}    ${xpath_string_with_columnum}   ${text_username}
   
   ${rows}     Get Length   ${rowWebelements}
   
   FOR  ${row}  IN RANGE   ${rows}-1
        ${textRow}   Evaluate  ${row}+1
        ${modified_xpath}=    Evaluate    "${xpath_string_with_columnum}" % ('${textRow}')
        Log To Console  ${modified_xpath}
        ${userNameColText}    Get Text   ${modified_xpath}         # ${colText} = 'Dominic.Chase'  
        Log To Console   ${userNameColText}
        IF  '${userNameColText}'=='${text_username}'
            Log To Console  data found at: ${textRow}
            ${userName_row_num}  Set Variable  ${textRow}
            Exit For Loop
        END
   END
   [Return]  ${userName_row_num}


logout out frome Orange HRM
    ${usr_profile}    Get WebElement    xpath://span[@class='oxd-userdropdown-tab']
    Click Element     ${usr_profile}
    Sleep   1s
    Element Should Be Visible   xpath://ul[@class='oxd-dropdown-menu']/li[4]     logout should be visible
    Click Element     xpath://ul[@class='oxd-dropdown-menu']/li[4]






    # Click Element    ${userRole}
    # Click Element    xpath://*[contains(text(),'Admin')]
    # Click Element   ${userStatus}
    # Click Element    xpath://*[contains(text(),'Enabled')]
    
    #$x("//input[contains(@class,'oxd-input oxd-input--active')]")[1][2][3]




   
    # ${selectList}    Get WebElement   xpath://div[contains(@class,'oxd-select-dropdown --positon-bottom') and @role='listbox']
    # ${userHint}    Get WebElement    xpath://div[contains(@class,'oxd-autocomplete-text-input oxd-autocomplete-text-input--active')]
    




 #DebugLibrary support step debugging since version 2.1.0. 
 # You can use step/s, next/n, continue/c, list/l and longlist/ll to trace and view the code step by step like in pdb:   

 # Input Text    xpath://input[contains(@class,'oxd-input oxd-input--active')]   ha
 # Click Element    xpath://div[contains(@class,'oxd-select-text oxd-select-text--active')]
 # Click Element    xpath://div[contains(@class,'oxd-select-text oxd-select-text--active')]
 # Click Element    xpath://div[contains(@class,'oxd-select-text oxd-select-text--active')]
 # Click Element    xpath://*[contains(text(),'Admin')]





login with new user
    Log  a
verify new user
    Log  a
delete new user
    Log  a
verify new user deleted
    Log  a

# Input Text    xpath://input[contains(@class,'oxd-input oxd-input--active')]   ha
# Click Element    xpath://div[contains(@class,'oxd-select-text oxd-select-text--active')]
# Click Element    xpath://div[contains(@class,'oxd-select-text oxd-select-text--active')]
# Click Element    xpath://div[contains(@class,'oxd-select-text oxd-select-text--active')]
# Click Element    xpath://*[contains(text(),'Admin')]

table data validation
   ${tableEle}    Get WebElement    xpath://div[@class='oxd-table']
   ${total_rows}  Get WebElements   xpath://div[@class='oxd-table']/div[2]/div/div
   ${rows}     Get Length   ${total_rows}
   Log To Console   ${rows}
   Table Header Should Contain   ${tableEle}       Username
#    Table Cell Should Contain
#    Get Table Cell
#    table data validation