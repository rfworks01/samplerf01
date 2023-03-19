*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary


*** Test Cases ***
Various Fake Methods
   Test Faker Lib


*** Keywords ***
Test Faker Lib
    ${first_name}      First Name
    ${pass}            Password     length=40
    ${phone_num}       Phone Number
    ${postal_code}     Postalcode
    ${profile}         Profile
    ${rand_in_range}   Random Element    element=('a','b','c','d','e','f','g','h','i')
    ${street_address}  Street Address
    ${street_name}     Street Name
    ${street_suffix}   Street Suffix
    
    Log To Console     ${first_name}
    Log To Console     ${pass}
    Log To Console     ${phone_num}
    Log To Console     ${postal_code}
    Log To Console     ${profile}
    Log To Console     ${rand_in_range}
    Log To Console     ${street_address}
    Log To Console     ${street_name}
    Log To Console     ${street_suffix}
