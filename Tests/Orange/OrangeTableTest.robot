*** Settings ***
Documentation   Upload file in emp info table

Library    SeleniumLibrary
Library    DebugLibrary
Library    FakerLibrary   locale=en_US
Library    ../../CustomKeywords/CustomLib.py
Resource   ../Orange/CommonOrange.robot
Resource   ../Orange/OrangeTables.robot

#Variables  ${EXECDIR}/PageObject/orange_locators/tables.py
# Variables  ${EXECDIR}/PageObject/orange_locators/myinfo_loc.py

*** Variables ***
${url1}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${timeout}   25s
${search_datax}

*** Test Cases ***
Verify data table in orange app
   [Setup]   open table site  ${url1}
   Login to OrangeHRM    Admin    admin123
   Click Orange Menu item  pim
   verify pim table
   Click Orange Menu item  Leave
   verify leave table
   Click Orange Menu item  recruitment
   verify recruitment table
   Click Orange Menu item  my info
   verify myinfo table     #tag-112233

Verify click on table elements
   [Setup]   open table site  ${url1}
   Login to OrangeHRM    Admin    admin123
   
   Click Orange Menu item  pim
   Click on table cell   1  3
      
   Click Orange Menu item  Leave
   Get specified table cell  1   3
   
   Click Orange Menu item  recruitment
   Get specified table cell  1   3
   
   Click Orange Menu item  my info
   Get specified table cell  1   3
     
   

*** Keywords ***

open table site  
   [Arguments]   ${site_url}
   Open Browser   browser=chrome    url=${site_url}
   Set Browser Implicit Wait  15s
   Sleep  4s

verify pim table  
  Sleep  7s
  ${row}  ${col}=   get row and coloumn from table  'Supervisor'   'Fiona Grace'
  Log To Console  row:${row}
  Log To Console  col:${col}


verify leave table
    Sleep  5s
    ${row}  ${col}=   get row and coloumn from table  'Employee Name'   'Linda Jane Anderson'
    Log To Console  row:${row}
    Log To Console  col:${col}


verify recruitment table
    Sleep  5s
    ${row}  ${col}=   get row and coloumn from table  'Status'   'Interview Failed'
    Log To Console  row:${row}
    Log To Console  col:${col}

verify myinfo table     
    Sleep  5s
    ${row}  ${col}=   get row and coloumn from table  'Description'   'tag-112233'
    Log To Console  row:${row}
    Log To Console  col:${col}

Click on table cell
    [Arguments]  ${row}   ${col}
    
    ${tableEle}   Get specified table cell  ${row}   ${col}
    Scroll Element Into View   ${tableEle}
    Sleep  1s
    Click Element  ${tableEle}
    Sleep  5s
    



