*** Settings ***
Documentation   sample github ci tests
Library     SeleniumLibrary


Suite Setup  Open Browser    url=${url}      browser=chrome   

*** Variables ***
${url}       https://www.google.com
${newuser_name}
${newuser_rownum}

*** Test Cases ***
Search Google01
    open search engine
    enter search term   juke box

Search Google02
    open search engine
    enter search term   'selenium'

Search Google03
    open search engine
    enter search term   'selenium robot works'


*** Keywords ***

open search engine
    Set Browser Implicit Wait   20s
enter search term 
    [Arguments]   ${data}
    Input Text    name=q     ${data}\n  