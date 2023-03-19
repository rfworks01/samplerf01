import time

from SeleniumLibrary import SeleniumLibrary
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

from selenium.webdriver.chrome.options import Options
from webdriver_manager import ChromeDriverManager





class InitBrowser(object):
    ROBOT_LIBRARY_SCOPE = 'TEST CASE'

    # #@keyword("Init ${browser} with ${url}")
    # def __init__(self):
    #     self.options = None

    def get_browser_driver(self):
        return BuiltIn().get_library_instance('SeleniumLibrary').driver

    @keyword("Init ${browser} browser with ${url1} and default_mode")
    @keyword("Init ${browser} browser with ${url1} and default mode headless=${mode}")
    def init_browser(self,browser, url1,headless_mode=False):
        if browser == "chrome":
            options = Options()
            prefs = {"download.default_directory": "/some/path"}
            #adding Chrome Profile Path
            #options.add_argument = {'user-data-dir':'/Users/Application/Chrome/Default'}
            options.add_argument('--disable-infobar')
            options.add_argument('--window-size=900,600')
            options.add_argument('--disable-blink-features=AutomationControlled')
            options.add_argument('--disable-extensions')
            #options.headless = headless_mode
            driver = BuiltIn().get_library_instance('SeleniumLibrary')
            path = ChromeDriverManager().get_download_path()
            print(path)
            driver.open_browser(url=url1,browser=browser,options=options,executable_path=path)
            time.sleep(5)


# def open_browser(self,
            #                  url: str | None = None,
            #                  browser: str = 'firefox',
            #                  alias: str | None = None,
            #                  remote_url: bool | str = False,
            #                  desired_capabilities: dict | None | str = None,
            #                  ff_profile_dir: str | None = None,
            #                  options: Any | None = None,
            #                  service_log_path: str | None = None,
            #                  executable_path: str | None = None) -> None