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
Create New Job Title
    Login to Orange    Admin    admin123
    go to admin page
    create new job title
 

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

create new job title
   
   ${navBarjobsEle}    Get WebElement   xpath://nav[contains(@aria-label,'Topbar Menu')]/ul/li[2]
   Click Element   ${navBarjobsEle}
   Sleep  2s
   
   ${jobTitleEle}     Get WebElement    xpath://*[contains(text(),'Job Titles')]
   Click Element   ${jobTitleEle}
   Sleep  6s

   ${addBTN}    Get WebElement     css:button.oxd-button.oxd-button--medium.oxd-button--secondary        #xpath://button[contains(text(),'Add')]
   Click Element   ${addBTN}
   Sleep  6s
   
   ${jobTitleTxtEle}  Get WebElement   xpath://label[contains(text(),'Job Title')]/following::input[1]
   ${jobDescTxtEle}   Get WebElement   xpath://label[contains(text(),'Job Description')]/following::textarea[1]
   ${jobNoteTxtEle}   Get WebElement   xpath://label[contains(text(),'Note')]/following::textarea[1]
   ${cancelBTN}       Get WebElement   xpath://div[@class='oxd-form-actions']/button[1]
   ${saveBTN}         Get WebElement   xpath://div[@class='oxd-form-actions']/button[2]

   Input Text     ${jobTitleTxtEle}    Sr. Consultant
   Input Text     ${jobDescTxtEle}     Sample Decription
   Input Text     ${jobNoteTxtEle}     Sample Note
   Click Element  ${cancelBTN}
   Sleep   6s

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


table data validation
   ${tableEle}    Get WebElement    xpath://div[@class='oxd-table']
   ${total_rows}  Get WebElements   xpath://div[@class='oxd-table']/div[2]/div/div
   ${rows}     Get Length   ${total_rows}
   Log To Console   ${rows}
   Table Header Should Contain   ${tableEle}       Username
#    Table Cell Should Contain
#    Get Table Cell
#    table data validation