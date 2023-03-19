
# Robot PageObject Model

## Folder Structure

### 1. CustomKeywords
User defined keywords to use in project

### 2. PageObject
Simple file same as .properties file.
    signup_btn = "xpath://button[@data-testid='sign-up-button']"

### 3. Resources
Consist files for all variables 

*** Settings ***
Library      FakerLibrary

*** Variables ***
@{VARLIST}          first_name

etc...


### Example of argument file

#""" Argument file to pass arguments to tests from external source """

--doc This is an example (where "special characters" are ok!)

#run test in specific order

--metadata X:Value with spaces

--variable VAR:Hello, world!

#This is a comment

#run from command line: robot --argumentfile argfile.robot

--name An Example

tests/GoogleTC01.robot

tests/FakerLibTests.robot


## Running the tests
> Robot --argumeentfile argFile.robot

## Python -m robot tests/sagepubsearchTC01.robot


