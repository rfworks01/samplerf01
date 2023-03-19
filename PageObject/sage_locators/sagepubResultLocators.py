#result page element
byResultHeadingText="xpath://div[contains(@class,'heading-medium margin-bottom--large')]"
byShowResultSelect = "id:edit-per-page"
bySortOptionSelect= "id:edit-sort-options"

parentEle ="//article[contains(@class,'product-search-solr col-sm-6 col-lg-3 margin-bottom--medium brand-parent--')]"
byResultEle = "xpath:"+parentEle
byResultTitle = "xpath:"+parentEle+"/child::div[3]/a"
byResultPrice = "xpath:"+parentEle+"/child::div[6]/span/span"
byReviewCopyTab= "xpath:"+parentEle+"/child::div[7]/a"





