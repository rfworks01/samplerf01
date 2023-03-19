*** Settings ***
Documentation  Holds common keywords


*** Keywords ***
Build Formatted Xpath
    [Arguments]   ${user_xpath}     ${arg}
    ${new_xpath}=  Replace Variables  ${user_xpath}
    Return From Keyword  ${new_xpath} 

Replace data in xpath
    [Arguments]   ${user_xpath}     ${data_to_replace}
    ${mod_xpath}=    Evaluate    "${user_xpath}"% (${data_to_replace})
    Log To Console    ${mod_xpath}
    [Return]  ${mod_xpath}