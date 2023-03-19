*** Settings ***
Documentation   This is

Library    SeleniumLibrary
Library    DebugLibrary
Library    FakerLibrary  WITH NAME  Fake
Library    ${userLib}/CustomLib.py
Resource   ${testLib}/CommonKeywords.robot

Variables  ${appLocators}/admin_loc.py
Variables  ${appLocators}/page01_loc.py
Variables  ${appLocators}/myinfo_loc.py
Variables  ${appLocators}/menu_loc.py
Variables  ${appLocators}/tables.py


*** Variables ***
${appURL}        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${testLib}       ${EXECDIR}/Tests
${userLib}       ${EXECDIR}/Resources/UserKeyword
${appLocators}   ${EXECDIR}/Variables/orange_locators
${timeout}       25s










