*** Settings ***
# Library     SeleniumLibrary
Resource    master_loader.robot



*** Variables ***
${timeout}    20s


*** Keywords ***
Login to OrangeHRM
    [Arguments]    ${username}     ${password}
    
    
    Wait Until Element Is Visible        ${usernameEle}       ${timeout}
    Input Text         ${usernameEle}    ${username}
    Input Text         ${passwordEle}    ${password}
    Click Element      ${submitBTNEle} 
    Wait Until Element Is Not Visible    ${submitBTNEle}    ${timeout}
    Sleep  3s
    # Wait Until Element Is Visible    ${pageHeadingEle}    ${timeout}

logout out frome Orange HRM
    Click Element     ${userProfileImg}
    Sleep   1s
    Element Should Be Visible   ${useLogoutOpton}     logout should be visible
    Click Element     ${useLogoutOpton}



Click Orange Menu item
   [Arguments]    ${menuitem_name}
    
     ${menuItem}   Evaluate   '${menuitem_name}'.lower()
     Log To Console  pass menu: ${menuItem}

     IF  '${menuItem}'=='admin'
          Log To Console  click on admin
          Click Element     ${menuADMIN}
          Sleep  4s
     END
     IF  '${menuItem}'=='pim'
         Log To Console  click on pim
         Click Element     ${menuPIM}
         Sleep  4s
     END  
     IF  '${menuItem}'=='time'
         Log To Console  click on time
         Click Element     ${menuTIME}
         Sleep  4s
     END      
     
     IF  '${menuItem}'=='my info'
        Log To Console  click on my info
        Click Element     ${menuMyinfo}
        Sleep  4s
     END 

     IF  '${menuItem}'=='leave'
        Click Element     ${menuLEAVE}
        Sleep  4s
     END  
     
     IF  '${menuItem}'=='recruitment'
        Log To Console  click on recruitment
        Click Element     ${menuRecruitment}
        Sleep  4s
     END



