*** Settings ***
Documentation   This is

Library    SeleniumLibrary
Library    DebugLibrary
Resource   ../master_loader.robot
Resource   ../CommonOrange.robot

# Library    ../../CustomKeywords/CustomLib.py
# Variables  ../../PageObject/orange_locators/page01_loc.py

Suite Setup  Open Browser    url=${url}      browser=chrome   

*** Variables ***
${url}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${timeout}   25s
${newuser_rownum}
${empID}
${empUserName}
&{empDetails}

*** Test Cases ***

Add new employee
    Login to OrangeHRM    Admin    admin123
    Click Orange Menu item  pim
    Add new employee details
    click save button
New Employee verify
    Click Orange Menu item  pim
    
   go to employee PIM page
    new user should exist in admin data table
    logout out frome Orange HRM
    Login to Orange     ${empUserName}   Test@1234
    logout out frome Orange HRM




new employee table pagination
    Login to Orange    Admin    admin123
    go to employee PIM page

new employee edit info of 3rd employee in table
    Login to Orange    Admin    admin123
    go to employee PIM page
    edit 3 employee row info



*** Keywords ***


Add new employee details
   
    Click Element    ${addEmpMenu}
    Sleep   2s
    Wait Until Element Is Visible    ${firstNameTxtEle}    ${timeout}
    Input Text   ${firstNameTxtEle}      roz
    Input Text   ${middleNameTxtEle}     mister
    Input Text   ${lastNameTxtEle}       hoye

    Sleep  2s
    Execute Javascript     arguments[0].value = ''       ARGUMENTS    ${empIDTxtEle}
    Sleep  2s

    ${var_digit}   Get Random Digits   2
    Log To Console   RandomDigit:  ${var_digit}
    Input Text    ${empIDTxtEle}   ${var_digit} 

    ${empIdText}   Get Element Attribute   ${empIDTxtEle}      value
    Set Suite Variable  ${empID}    ${empIdText}
     
    ${status}   Run Keyword And Return Status   Click Element  ${createLoginDetailCHKEle}
    
    IF  ${status} == True
        
        Sleep  3s
        ${var_digit}   Get Random Digits   4
        Set Test Variable   ${empUserName}   joe${var_digit}

        Input Text     ${userNameTxtEle}  ${empUserName} 
        Input Text     ${pass1TxtEle}     Test@1234
        Input Text     ${pass2TxtEle}     Test@1234
        
    END

 
click cancel button
    Click Element   ${cancelBTN}

click save button
   Log To Console  Emp-ID: ${empID}
   Log To Console  Emp-userName: ${empUserName}
   Click Element  ${saveBTN}
   sleep  5s
   Wait Until Element Contains     css:h6.oxd-text.oxd-text--h6.orangehrm-main-title     Personal Details       ${timeout}
   Log To Console  Successfully added new employee


new user should exist in admin data table
   Sleep   7s
   ${tableEle}    Get WebElement    xpath://div[contains(@class,'oxd-table orangehrm-employee-list')]
   
   ${total_rows}     Get WebElements   xpath://div[contains(@class,'oxd-table orangehrm-employee-list')]//div[@role='row']
   ${total_columns}  Get WebElements   xpath://div[@class='oxd-table-body']/div[1]/div/div
   
   ${rows}     Get Length   ${total_rows}
   ${columns}  Get Length   ${total_columns}

   FOR  ${row}  IN RANGE   ${rows}-1
        ${textRow}   Evaluate  ${row}+1
        ${userIDColText}    Get Text  xpath://div[@class='oxd-table-body']/div[${textRow}]/div/div[2]         # ${colText} = 'Dominic.Chase'  
        # Log To Console        ${userIDColText}
   END
   
   Log To Console  Search username in table rows and get row num
   ${userRowNUm}=   Run Keyword  get user row from user table    ${total_rows}    xpath://div[@class='oxd-table-body']/div[%s]/div/div[2]   ${empID}
   Log To Console  username found at row num: ${userRowNUm}
   Set Test Variable   ${newuser_rownum}   ${userRowNUm}
   
   ${empDetails}   Create Dictionary  empId=${empID}    newEmp=${empUserName}    

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
        # Log To Console  ${modified_xpath}
        ${userNameColText}    Get Text   ${modified_xpath}         # ${colText} = 'Dominic.Chase'  
        # Log To Console   ${userNameColText}
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

search new id in pagination exist
    Log To Console  xxxx
    
Get CSS Property Value
    [Documentation]
    ...    Get the CSS property value of an Element.
    ...    
    ...    This keyword retrieves the CSS property value of an element. The element
    ...    is retrieved using the locator.
    ...    
    ...    Arguments:
    ...    - locator           (string)    any Selenium Library supported locator xpath/css/id etc.
    ...    - property_name     (string)    the name of the css property for which the value is returned.
    ...    
    ...    Returns             (string)    returns the string value of the given css attribute or fails.
    ...        
    [Arguments]    ${locator}    ${attribute name}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    [Return]     ${prop_val}

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


emp information
   ${EmployeeName}      Get WebElement      xpath://label[contains(text(),'Employee Name')]/following::input[1]
   ${EmployeeId}        Get WebElement      xpath://label[contains(text(),'Employee Id')]/following::input[1]
   ${SupervisorName}    Get WebElement      xpath://label[contains(text(),'Supervisor Name')]/following::input[1]
   
   @{SelectEmpInfo}     Get WebElements     css:div.oxd-select-text-input
   ${SelectEmpStatus}   Get WebElement      ${SelectEmpInfo}[0] 
   ${SelectInclude}     Get WebElement      ${SelectEmpInfo}[1] 
   ${SelectJobTitle}    Get WebElement      ${SelectEmpInfo}[2]
   ${SelectSubUnit}     Get WebElement      ${SelectEmpInfo}[3]

   #Select elements
   ${selectEmpStatus}   Get WebElement   xpath://label[contains(text(),'Employment Status')]/following::div[2]
   ${selectEmpInclude}   Get WebElement   xpath://label[contains(text(),'Include')]/following::div[2]
   ${selectEmpJobTitle}   Get WebElement  xpath://label[contains(text(),'Job Title')]/following::div[2]
   ${selectEmpSub Unit}   Get WebElement   xpath://label[contains(text(),'Sub Unit')]/following::div[2]
   
   #buttons
   ${btnReset}   Get WebElement  xpath://div[@class='oxd-form-actions']//button[1]
   ${btnSearch}  Get WebElement  xpath://div[@class='oxd-form-actions']//button[2]

   





