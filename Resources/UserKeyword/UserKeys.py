from PageObjectLibrary import PageObject
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn;
from SeleniumLibrary import SeleniumLibrary;
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from selenium.webdriver.common.by import By
from Selenium2Library import Selenium2Library
from SeleniumLibrary.keywords import BrowserManagementKeywords
import time


class UserKeys(object):
    ROBOT_LIBRARY_SCOPE = 'TEST CASE'

    # @keyword("enter asana email")
    def enter_new_user_password(self):
        BuiltIn().log_to_console("I am in method")
        self.lib = BuiltIn().get_library_instance('SeleniumLibrary').driver
        self.driver = BuiltIn().get_library_instance('SeleniumLibrary').driver    #SeleniumLibrary().driver
        self.driver.find_element(By.NAME, 'password').send_keys("Test@1234")

        # SeleniumLibrary.create_webdriver()[def create_webdriver(self,driver_name: str, alias: str | None = None,
        #                                    kwargs: dict = {},**init_kwargs: Any) -> None]

        # SeleniumLibrary.

        # self.selib.input_text(self.locator.user_email, username)
        # self.selib.click_element(self.locator.signInNextBTN)
        # time.sleep(3)
        #
        # self.seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
        # self.seleniumlib.input_text("name=p", "ele@1234")
        #
        # # self.selib.input_text(self.locator.userPassword, password)
        # # self.selib.click_element(self.locator.submit_button)
        # self.selib.wait_until_element_is_visible(self.locator.projectList,timeout=50)
        # self.selib.capture_page_screenshot("1.png")
