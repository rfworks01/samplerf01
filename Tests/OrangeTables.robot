*** Settings ***
Library     SeleniumLibrary

Resource   ${EXECDIR}/Tests/master_loader.robot
Resource   ${EXECDIR}/Tests/CommonKeywords.robot
# Resource   ../Orange/CommonKeywords.robot
# Variables  ${EXECDIR}/orange_locators/tables.py
# Variables   ${EXECDIR}/PageObject/orange_locators/myinfo_loc.py


*** Variables ***
${timeout}    20s
${row_num}    0
${col_num}    0
${tab_cell}   None

*** Keywords ***

get row coloumn from my info personel details attachment table
   [Documentation]   ${headercols}    ${rows}    
   [Arguments]    ${search_col_name}   ${search_txt_data}
   Log To Console  Attachment table vitals:

  
   @{attachmentTableHeader}    Get WebElements   ${attachmentTableHeader}
   @{attachmentTableRows}   Get WebElements  ${attachmentTableRows}
   
   # "//div[@class='oxd-table-body']/div[${row_num}]/div/div[${col_num}]"

   ${totalCols}   Get Length  ${attachmentTableHeader}
   ${totalRows}   Get Length  ${attachmentTableRows}

   Log To Console  Total Attachment table Cols: ${totalCols}
   Log To Console  Total Attachment table Rows: ${totalRows} 

   
   #File Name  #Description #Size  #Type  #Date Added  #Added By     #Actions
   
   ${search_col_name}   Set Variable  ${search_col_name}
   ${search_data}  Set Variable  ${search_txt_data}

   # ${col_num}   Set Variable   
   FOR  ${colx}  IN RANGE  ${totalCols}   

      ${colA}  Evaluate  ${colx}+1
      ${col}  Build Formatted Xpath  ${format_attachmentTableCols}   ${colA}
      
      ${col_text}   Get Text   ${col}        ###xpath://div[@class='oxd-table']/div[@class='oxd-table-header']/child::div/div[${col}]
      Log To Console  ${col_text}
      IF  '${col_text}'==${search_col_name}
           ${col_num}  Set Variable  ${colA}
           Exit For Loop
      END
        
   END
   
   #Print row data on based of row number 
   FOR  ${row_numx}  IN RANGE  ${totalRows}
         ${row_num1}  Evaluate  ${row_numx}+1
         ${rowData}    Get Text   xpath://div[@class='oxd-table-body']/div[${row_num1}]/div/div[${col_num}]
         Log To Console    ${rowData} 
         IF  '${rowData}'==${search_data}
              Log To Console  Found data at: ${row_num1}
              ${row_num}  Set Variable  ${row_num1}
              Exit For Loop
         END
   END
   
   [return]   ${row_num}   ${col_num}



get row and coloumn from table
   [Documentation]   ${headercols}    ${rows}    
   [Arguments]    ${search_col_name}   ${search_txt_data}
   Log To Console  Attachment table vitals:
   
   # ${record_found_text}   Get Text  xpath://div[contains(@class,'orangehrm-header-container')]/span
   # IF  '${record_found_text}' == 'No Records Found'
   #      Log To Console  No record found for table
   
   # ELSE
      @{TableHeader}  Get WebElements  ${tableHeaders}
      @{TableRows}    Get WebElements  ${tableRows}

      ${rowLen}     Get Length   ${TableRows}
      # Log To Console  total rows: ${rowLen}
   IF  ${rowLen} > 0
      # "//div[@class='oxd-table-body']/div[${row_num}]/div/div[${col_num}]"
      Log To Console  rows found greater than 0
      ${totalCols}   Get Length  ${TableHeader}
      ${totalRows}   Get Length  ${TableRows}

      Log To Console  Total Attachment table Cols: ${totalCols}
      Log To Console  Total Attachment table Rows: ${totalRows} 
      #File Name  #Description #Size  #Type  #Date Added  #Added By     #Actions
   
      ${search_col_name}   Set Variable  ${search_col_name}
      ${search_data}  Set Variable  ${search_txt_data}
   
      # Log To Console  Searching col data...
      # ${col_num}   Set Variable   
      FOR  ${colx}  IN RANGE  ${totalCols}   
         ${colA}  Evaluate  ${colx}+1
         ${col}  Build Formatted Xpath  ${fmt_tableheaders}   ${colA}
      
         ${col_text}   Get Text   ${col}    
         # Log To Console  ${col_text}
         IF  '${col_text}'== ${search_col_name}
           ${col_num}  Set Variable  ${colA}
           Exit For Loop
         END
      END
      # Log To Console  \n
      # Log To Console  Searching row data...
      #Print row data on based of row number 
      FOR  ${row_numx}  IN RANGE  ${totalRows}
         ${row_num1}  Evaluate  ${row_numx}+1
         ${rowData}    Get Text   xpath://div[@class='oxd-table-body']/div[${row_num1}]/div/div[${col_num}]
         # Log To Console    ${rowData}
         IF  '${rowData}'==${search_data}
              Log To Console  data found at row: ${row_num1}
              ${row_num}  Set Variable  ${row_num1}
              Exit For Loop
         END
      END

   END
   [return]   ${row_num}   ${col_num}

Get specified table cell
      [Arguments]       ${row_num}   ${col_num}

      Scroll Element Into View   ${tableHeaders}
      Sleep  1s
      @{TableHeader}  Get WebElements  ${tableHeaders}
      @{TableRows}    Get WebElements  ${tableRows}
      
      ${rowLen}     Get Length   ${TableRows}
      # Log To Console  total rows: ${rowLen}
      IF  ${rowLen} > 0
          ${tab_cell}    Get WebElement   xpath://div[@class='oxd-table-body']/div[${row_num}]/div/div[${col_num}]
      END
      [Return]  ${tab_cell}




