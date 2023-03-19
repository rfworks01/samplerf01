*** Settings ***
Documentation   This is

Resource   ../CommonOrange.robot
Resource   ../OrangeTables.robot

Suite Setup  Open Browser    url=${url}      browser=chrome   

*** Variables ***
${url}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${newuser_name}
${newuser_rownum}

*** Test Cases ***
Create New Admin User
    Login to OrangeHRM    Admin    admin123
    Click Orange Menu item  Admin
    go to Add new use management page
    Input username,password and employee_name   selectUserStatus=Enabled
    click add user save button
    Search new user
    verify admin user table 
    logout out frome Orange HRM

Login with New Admin User
    Login to OrangeHRM    ${newuser_name}    Test@1234
    Sleep   4s
    logout out frome Orange HRM



*** Keywords ***
go to Add new use management page
    ${adminTitle}    Get Text    ${pageHeadingEle}
    Log To Console  ${adminTitle}

    Log To Console  click on add button
    Click Element   ${tableRecordAddBTN}
    Sleep  7s


Input username,password and employee_name
    [Arguments]      ${selectUserRole}=None  ${selectUserStatus}=None  ${newuser_name}=None     ${pwd}=None  

    Wait Until Element Is Visible    ${pageTextEle}    ${timeout}
    ${adminTitle}     Get Text   ${pageTextEle}
    Log To Console   Page Title: ${adminTitle}
     
    Element Text Should Be    ${pageTextEle}     Admin
    Run Keyword If   '${adminTitle}' == 'Admin'
    ...         Run Keywords
    ...         Click Element     ${selectNewUserRole}
    ...         AND   Sleep  1s
    ...         AND   Click Element    xpath://*[contains(text(),'Admin')]
    ...         AND   Sleep  1s
    ...         AND   Click Element  ${selectNewStatus}
    ...         AND   Sleep  1s
    ...         AND   Click Element    xpath://*[contains(text(),'${selectUserStatus}')]
    
    ${var_digit}   Get Random Digits   4
    Log To Console   RandomDigit:  ${var_digit}
    Set Suite Variable   ${newuser_name}     Alpa${var_digit}

    ${adminTitle}     Get Text   ${pageTextEle}
    Log To Console   Page Title: ${adminTitle}
    Sleep  2s
    
    Input Text    ${TxtNewUsername}        ${newuser_name}
    Input Text    ${TxtNewUserPassword}    Test@1234
    Input Text    ${TxtNewUserRePassword}  Test@1234  
    Sleep  2s   
   
    # ${empName}    Get WebElement    ${TxtNewUserEmployeeName} 
    # Input Text   ${empName}   Jo
    # Sleep  2s
    # Execute Javascript     arguments[0].value = ''       ARGUMENTS    ${empName}
    # Sleep  2s
   
    ${empName}    Get WebElement    ${TxtNewUserEmployeeName} 
    Input Text   ${empName}   A
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
   Click Button   ${doneBTN}
   Sleep   5s

Search new user
   Wait Until Element Is Visible   ${TxtNewUsername}   15s
   Input Text    ${TxtNewUsername}        ${newuser_name}
   Click Button   ${doneBTN}
   Sleep   5s

verify admin user table  
  Sleep  7s
  ${row}  ${col}=   get row and coloumn from table  'Username'   '${newuser_name}'
  Log To Console  row:${row}
  Log To Console  col:${col}
  Should Be Equal   '1'   '${row}'    msg=Exactly one row found
  
  ${cell_data}  Get specified table cell   ${row}  ${col}
  ${table_cell_text}   Get Text   ${cell_data}

  Should Be Equal  ${table_cell_text}   ${newuser_name}   