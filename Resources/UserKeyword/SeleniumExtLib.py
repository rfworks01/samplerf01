from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from SeleniumLibrary import SeleniumLibrary
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By



# class SeleniumExtLib(SeleniumLibrary):
class SeleniumExtLib(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    # @keyword()
    # def js_execute(self, element):
    #
    #     self.driver.execute_script("arguments[0].click();", element)
    #     # self.driver.execute_script("arguments[0].click();",element)
    #     # return "Hello World"

    @keyword()
    # def get_Child_webelement(self, parent_xpath, child_xpath):
    def get_Child_webelement(self,parent_xpath, child_xpath):
        self.selib = BuiltIn().get_library_instance("SeleniumLibrary")
        return self.selib.driver.find_element(By.XPATH, parent_xpath).find_elements(By.XPATH, child_xpath)
        #return self.driver.find_element(By.XPATH, parent_xpath).find_elements(By.XPATH, child_xpath)


    def drag_drop(e1, e2):
        selib = BuiltIn().get_library_instance("SeleniumLibrary")
        # ActionChains(selib.driver).key_down(Keys.CONTROL).click(e1).drag_and_drop(e1,e2).key_up(Keys.CONTROL).perform()        #d.click_and_hold(e1).move_to_element(e2).release(e2).perform()
        ActionChains(selib.driver).drag_and_drop(e1, e2).perform()
