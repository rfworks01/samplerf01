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
${newuser_rownum}
${empID}
${empUserName}
&{empDetails}

*** Test Cases ***

Search employee using ID
    Login to Orange    Admin    admin123
    go to employee PIM page
    search emp information  empId=0046
    get text list of emp status
    click employee search button
    result table row should be exacatly  2
    # logout out frome Orange HRM




*** Keywords ***

Login to Orange
    [Arguments]    ${username}     ${password}
    ${var_digit}   Get Random Digits   4
    Log To Console   RandomDigit:  ${var_digit}
    ${winSize}    Get Window Size             #(1051, 806)
    Log To Console  win size: ${winSize}
    Set Window Size   1200  806
        
    Wait Until Element Is Visible        ${usernameEle}       ${timeout}
    Input Text         ${usernameEle}    ${username}
    Input Text         ${passwordEle}    ${password}
    Click Element      ${submitBTNEle} 

    Wait Until Element Is Visible    ${pageHeadingEle}    ${timeout}

go to employee PIM page
    Wait Until Element Is Visible    ${menuPIMEle}    ${timeout}
    Log To Console  click on admin
    
    Click Element    ${menuPIMEle}
    Sleep  7s
    Wait Until Element Is Visible    ${addEmpMenu}    ${timeout}

logout out frome Orange HRM
    ${usr_profile}    Get WebElement    xpath://span[@class='oxd-userdropdown-tab']
    Click Element     ${usr_profile}
    Sleep   1s
    Element Should Be Visible   xpath://ul[@class='oxd-dropdown-menu']/li[4]     logout should be visible
    Click Element     xpath://ul[@class='oxd-dropdown-menu']/li[4]

search new id in pagination exist
    Log To Console  xxxx
    
edit 3 employee row info
   
   ${empID}      Get WebElement   xpath://div[@class='oxd-table-body']/div[3]/div/div[2]
   ${empName}    Get WebElement   xpath://div[@class='oxd-table-body']/div[3]/div/div[3]
   ${deleteBTN}  Get WebElement   xpath://div[@class='oxd-table-body']/div[3]/div/div[9]//button[1]
   ${editBTN}    Get WebElement   xpath://div[@class='oxd-table-body']/div[3]/div/div[9]//button[2]

   Log To Console   3 row info:${empID}   

   Click Element  ${editBTN}
   Sleep   7s

   #employee info page
   ${empNickName}              Get WebElement   xpath://label[contains(text(),'Nickname')]/following::input[1]
   ${driverLicNumberTxtEle}    Get WebElement   xpath://label[contains(text(),'License Number')]/following::input[1]
   ${expiryLicDateTxtEle}      Get WebElement   xpath://label[contains(text(),'License Expiry Date')]/following::input[1] 
#    ${}    Get WebElement 
#    ${}    Get WebElement   
   Click Element   ${expiryLicDateTxtEle} 
   Sleep   7s


search emp information
   [Arguments]  ${empName}=None    ${empId}=None   ${supervisor}=None
   # ${EmployeeName}      Get WebElement      xpath://label[contains(text(),'Employee Name')]/following::input[1]
   # ${EmployeeId}        Get WebElement      xpath://label[contains(text(),'Employee Id')]/following::input[1]
   # ${SupervisorName}    Get WebElement      xpath://label[contains(text(),'Supervisor Name')]/following::input[1]
   
   # #Select elements
   # ${selectEmpStatus}   Get WebElement   xpath://label[contains(text(),'Employment Status')]/following::div[2]
   # ${selectEmpInclude}   Get WebElement   xpath://label[contains(text(),'Include')]/following::div[2]
   # ${selectEmpJobTitle}   Get WebElement  xpath://label[contains(text(),'Job Title')]/following::div[2]
   # ${selectEmpSubUnit}   Get WebElement   xpath://label[contains(text(),'Sub Unit')]/following::div[2]
   Input Text     ${EmployeeId}    ${empId}
   

get text list of emp status

   ${selectEmpStatus}   Get WebElement   xpath://label[contains(text(),'Employment Status')]/following::div[2]
   ${selectEmpInclude}   Get WebElement   xpath://label[contains(text(),'Include')]/following::div[2]

   Click Element    ${selectEmpStatus}
   Sleep   2s
      
   ${dynamicListEle}   Get WebElement   xpath://div[contains(@class,'oxd-select-dropdown --positon-bottom')]
   @{dynEle}    Get WebElements   xpath://div[contains(@class,'oxd-select-dropdown --positon-bottom')]/div
   ${list}    Get Length   {dynEle}
   Log To Console  ${list}
   
   ${scrollable}   Execute JavaScript    return arguments[0].scrollHeight > arguments[0].offsetHeight;     ARGUMENTS     ${dynamicListEle}   
   Log To Console  scrollable: ${scrollable}
   
   
   Click Element    ${selectEmpInclude}
   Sleep   2s
      
   ${dynamicListEle}   Get WebElement   xpath://div[contains(@class,'oxd-select-dropdown --positon-bottom')]
   @{dynEle}    Get WebElements   xpath://div[contains(@class,'oxd-select-dropdown --positon-bottom')]/div
   ${list}    Get Length   {dynEle}
   Log To Console  ${list}
   FOR  ${listEle}  IN  ${dynEle}
       Execute JavaScript   arguments[0].scrollTop=arguments[1].offsetTop;     ARGUMENTS   ${dynamicListEle}   ${listEle}
       Sleep  1s
   END

   ${scrollable}   Execute JavaScript    return arguments[0].scrollHeight > arguments[0].offsetHeight;     ARGUMENTS     ${dynamicListEle}   
   Log To Console  scrollable: ${scrollable}

   #   ${search_result}=    Execute JavaScript    return floatMaster.querySelectorAll('#gContact_searcResultshWindow .gContactDetailClientListDiv .gContactListName')[${index}].innerText
   #   Execute JavaScript   arguments[0].scrollTop=arguments[1].offsetTop,    ARGUMENTS   divWithScrollbarElement  elementToScrollTo

 
click employee search button

   #buttons
   ${btnReset}   Get WebElement  xpath://div[@class='oxd-form-actions']//button[1]
   ${btnSearch}  Get WebElement  xpath://div[@class='oxd-form-actions']//button[2]
   Click Element  ${btnSearch}
   Sleep  10s

result table row should be exacatly
      [Arguments]   ${result_row}
      ${rows}   Convert To String    Get employee table rows
      
      Should Be Equal    ${rows}      ${result_row}

Get employee table rows
   Sleep   5s
   ${tableEle}    Get WebElement    xpath://div[contains(@class,'oxd-table orangehrm-employee-list')]
   
   ${total_rows}     Get WebElements   xpath://div[contains(@class,'oxd-table orangehrm-employee-list')]//div[@role='rowgroup']
   ${total_columns}  Get WebElements   xpath://div[@class='oxd-table-body']/div[1]/div/div
   
   ${rows}     Get Length   ${total_rows}
   ${columns}  Get Length   ${total_columns}
   
   Log To Console  rows: ${rows}
   Log To Console  columns: ${columns}
   [return]  ${rows}



    