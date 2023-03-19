*** Settings ***
Library      FakerLibrary
*** Variables ***
@{VARLIST}          first_name,last_name,user_email,street_address
@{VARLIST1}         ${first_name},${first_name},${user_email}
${first_name}       FirstName
${last_name}
${user_email}
${street_address}