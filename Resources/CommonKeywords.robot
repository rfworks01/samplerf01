*** Settings ***
Resource    ${EXECDIR}/Tests/master_loader.robot



*** Keywords ***


Wait And Click Element
    [Arguments]    ${elemet}        ${timeout}
    wait until element is not visible   ${elemet}      timeout=${timeout}
    Click Element     ${elemet}

Wait And Type Text
    [Arguments]    ${elemet}        ${timeout}    ${text_to_input}
    wait until element is not visible   ${elemet}      timeout=${timeout}
    INPUT TEXT    ${elemet}        ${text_to_input}

Select Element From UL List
    [Arguments]    ${elemet}        ${text_to_Select}   ${timeout}
    wait until element is visible   ${elemet}      timeout=${timeout}

    ${ULElements}=    Get WebElements    ${elemet}
    ${x1}=    Get Length    ${ULElements}
    FOR    ${i}  IN RANGE  ${x1}
        MOUSE OVER  ${ULElements}[${i}]
        ${x2}    Get Text    ${ULElements}[${i}]
#        ${my_string}  Evaluate  r'${x2}'
        Log To Console    ${x2}            #${my_string}
        IF    '${x2}' == '${text_to_Select}'
#           set test variable  ${hear_element}  =  ${x2}
           click element   ${ULElements}[${i}]
           BREAK
        END
    END
