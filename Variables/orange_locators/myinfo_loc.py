
btnAddAttach="xpath://*[contains(@class,'oxd-button oxd-button--medium oxd-button--text')]"
uploadFileEle="xpath://label[contains(text(),'Select File')]/following::input[1]"
browserBTN="xpath://div[contains(@class,'oxd-file-button')]"
textAreaComment="xpath://label[contains(text(),'Comment')]/following::textarea[1]"

btnAddAttachmentCancel="xpath://div[3]/button[1]"
btnAddAttachmentSave="xpath://div[3]/button[2]"

#myInfo
##personel details
###Attachment table
attachmentTableHeader = "xpath://div[@class='oxd-table']/div[@class='oxd-table-header']/child::div/div"
attachmentTableRows="xpath://div[@class='oxd-table-body']/div"

# "//div[@class='oxd-table-body']/div[${row_num}]/div/div[${col_num}]"
format_attachmentTableCols = "xpath://div[@class='oxd-table']/div[@class='oxd-table-header']/child::div/div[${arg}]"
format_BTNColActionEdit="xpath://div[@class='oxd-table-body']/div[@class='oxd-table-card']/div[%s]/div[8]//button[1]"
format_BTNColActionDelete="xpath://div[@class='oxd-table-body']/div[@class='oxd-table-card']/div[${arg}]/div[8]//button[2]"
format_BTNColActionDownload="xpath://div[@class='oxd-table-body']/div[@class='oxd-table-card']/div[${arg}]/div[8]//button[3]"
