*** Settings ***
Documentation   Upload file in emp info table

Library    SeleniumLibrary
Library    DebugLibrary
Library    FakerLibrary   locale=en_US
Library    ../../CustomKeywords/CustomLib.py
Resource   ../Orange/CommonOrange.robot
Resource   ../Orange/OrangeTables.robot
# Variables  ${EXECDIR}/PageObject/orange_locators/tables.py
# Variables  ${EXECDIR}/PageObject/orange_locators/myinfo_loc.py

*** Variables ***
${url1}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${timeout}   25s
${search_datax}

*** Test Cases ***
Verify Admin data table
   [Setup]   open table site  ${url1}
   Login to OrangeHRM    Admin    admin123
   Click Orange Menu item  my info
   verify user on emp info page
   edit data in attachment table

*** Keywords ***
open table site  
   [Arguments]   ${site_url}
   Open Browser   browser=chrome    url=${site_url}
   Set Browser Implicit Wait  15s
   Sleep  7s

verify user on emp info page
   
   #Add attach button and upload document

   ${AddAttachbtn}   Get WebElement   ${btnAddAttach}   
   Execute Javascript   arguments[0].scrollIntoView({block: 'center', inline: 'nearest'})   ARGUMENTS    ${AddAttachbtn}
   
   ${digi}=    Get Random Digits Between Range  1000  1500      
   ${dig}   Convert To String   ${digi}
   ${comment}=   Catenate    sample text file - ${dig}
   Set Test Variable   ${search_datax}  ${comment}
   Log To Console  ${search_datax}
   Run Keywords   Click Element   ${btnAddAttach}   
   ...            AND  Sleep  2s
   ...            AND  Choose File   ${uploadFileEle}   ${EXECDIR}/TestData/sample.txt
   ...            AND  Sleep  2s
   ...            AND  Input Text  ${textAreaComment}    ${comment}
   ...            AND  Sleep  2s
   ...            AND  Click Element    ${btnAddAttachmentSave}
   ...            AND  Sleep  6s


edit data in attachment table
   [Documentation]   ${headercols}    ${rows}    ${search_col_name}   ${search_data}
   Log To Console  Attachment table vitals:
   Log To Console  ${search_datax}
   ${row_numx}  ${col_numx}=   get row coloumn from my info personel details attachment table     'Description'    '${search_datax}'
   
   ${mydat}  Convert To String  ${row_numx}
   #opearte the button opertion
   #click on edit button
   
   # ${row_edit_btn}  Build Formatted Xpath   ${format_BTNColActionEdit}   ${mydat}
    ${row_edit_btn}   Replace data in xpath   ${format_BTNColActionEdit}   ${mydat}
   Log To Console    ${row_edit_btn}
   Click Element   ${row_edit_btn}
   # Click Element   xpath://div[@class='oxd-table-body']/div[${row_numx}]/div/div[8]//button[1]
   Sleep  6s




   
   # Set Window Size   800   700
   # Sleep  6s