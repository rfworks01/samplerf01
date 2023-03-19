
##Add User Page
pageTextEle="class:oxd-topbar-header-title"
selectEle ="xpath://div[contains(@class,'oxd-select-text oxd-select-text--active')]"
dynamicListEle ="xpath://div[contains(@class,'oxd-autocomplete-dropdown --positon-bottom')]"
userInputBoxEle="xpath://input[contains(@class,'oxd-input oxd-input--active')]"
empInputBoxEle ="xpath://input[contains(@placeholder,'Type for hints...')]"
caneclBTN="xpath://div[contains(@class,'oxd-form-actions')]/button[1]"
saveBTN="xpath://div[contains(@class,'oxd-form-actions')]/button[2]"

##Add Employee Page Feilds
addEmpMenu="xpath://*[contains(text(),'Add Employee')]"
empListTable="xpath://div[contains(@class,'oxd-table orangehrm-employee-list')]"


##Add New Employee
photoUploadEle="xpath://input[@type='file' and @class='oxd-file-input']"
firstNameTxtEle="xpath://label[contains(text(),'Employee Full Name')]/following::input[1]"
middleNameTxtEle="xpath://label[contains(text(),'Employee Full Name')]/following::input[2]"
lastNameTxtEle="xpath://label[contains(text(),'Employee Full Name')]/following::input[3]"
empIDTxtEle="xpath://label[contains(text(),'Employee Id')]/following::input[1]"
createLoginDetailCHKEle= "css:span.oxd-switch-input.oxd-switch-input--active.--label-right"
enabledChkEle="xpath://input[@type='radio' and @value='1']"
disabledChkEle="xpath://input[@type='radio' and @value='2']"
userNameTxtEle="xpath://label[contains(text(),'Username')]/following::input[1]"   
pass1TxtEle="xpath://label[contains(text(),'Password')]/following::input[1]" 
pass2TxtEle="xpath://label[contains(text(),'Confirm Password')]/following::input[1]"
cancelBTN="xpath://div[@class='oxd-form-actions']/button[1]"
saveBTN="xpath://div[@class='oxd-form-actions']/button[2]"

##Employee Info elements
EmployeeName="xpath://label[contains(text(),'Employee Name')]/following::input[1]"
EmployeeId="xpath://label[contains(text(),'Employee Id')]/following::input[1]"
SupervisorName="xpath://label[contains(text(),'Supervisor Name')]/following::input[1]"
#####Select elements
selectEmpStatus="xpath://label[contains(text(),'Employment Status')]/following::div[2]"
selectEmpInclude="xpath://label[contains(text(),'Include')]/following::div[2]"
selectEmpJobTitle="xpath://label[contains(text(),'Job Title')]/following::div[2]"
selectEmpSubUnit="xpath://label[contains(text(),'Sub Unit')]/following::div[2]"