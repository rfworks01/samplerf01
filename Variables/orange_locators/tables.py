# "//div[@class='oxd-table-body']/div[${row_num}]/div/div[${col_num}]"


#admin  #Leave table  #Time table  #Recuritment
##admin details table  ##Leave details table  ##Time details table   ##Recuritment details table 
##admin Info table    ##Leave Info table   ###Time info table  ###Recuritment info table

#=>tableHeaders="xpath://div[@class='oxd-table']/div[@class='oxd-table-header']/child::div/div"
tableHeaders="xpath://div[@class='oxd-table-header']/child::div/div"
fmt_tableheaders="xpath://div[@class='oxd-table-header']/child::div/div[${arg}]"
tableRows="xpath://div[@class='oxd-table-body']/div"

####Admin Actions button column
format_DelEmpRowBTN="xpath://div[@class='oxd-table-body']/div[${arg}]/div/div[6]//button[1]"
format_EditEmpRowBTN="xpath://div[@class='oxd-table-body']/div[${arg}]/div/div[6]//button[2]"

####Leave Actions button column
fmt_ApproveLeaveRowBtn="xpath://div[@class='oxd-table-body']/div[${arg}]/div/div[9]//button[1]"
fmt_RejectLeaveRowBtn="xpath://div[@class='oxd-table-body']/div[${arg}]/div/div[9]//button[2]"
fmt_OptionLeaveRowBtn="xpath://div[@class='oxd-table-body']/div[${arg}]/div/div[9]//button[3]"

###Time Actions button column
fmt_ViewTimeRowBtn="xpath://div[@class='oxd-table-body']/div[${arg}]/div/div[3]//button[1]"

##Recuritment Actions button column
fmt_ViewRecruitmentRowBtn="xpath://div[@class='oxd-table-body']/div[3]/div/div[7]//button[1]"
fmt_EditRecruitmentRowBtn="xpath://div[@class='oxd-table-body']/div[3]/div/div[7]//button[2]"
fmt_DownloadRecruitmentRowBtn="xpath://div[@class='oxd-table-body']/div[3]/div/div[7]//button[3]"


#pim page
##pim details table
##pim Info table
pimTableHeader="xpath://div[@class='oxd-table orangehrm-employee-list']/div[@class='oxd-table-header']/child::div/div"
pimTableRows="xpath://div[@class='oxd-table-body']/div"
####Actions column
format_pimEditRowBTN="xpath://div[@class='oxd-table-body']/div[${arg}]/div/div[9]//button[2]"
format_pimDelBTN="xpath://div[@class='oxd-table-body']/div[${arg}]/div/div[9]//button[1]"


#myInfo
##personel details
###Attachment table
attachmentTableHeader = "xpath://div[@class='oxd-table']/div[@class='oxd-table-header']/child::div/div"
attachmentTableRows="xpath://div[@class='oxd-table-body']/div"
####Actions column
format_BTNColActionEdit="xpath://div[@class='oxd-table-body']/div[@class='oxd-table-card']/div[%s]/div[8]//button[1]"
format_BTNColActionDelete="xpath://div[@class='oxd-table-body']/div[@class='oxd-table-card']/div[%s]/div[8]//button[2]"
format_BTNColActionDownload="xpath://div[@class='oxd-table-body']/div[@class='oxd-table-card']/div[%s]/div[8]//button[3]"



