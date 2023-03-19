import sys, os, time
from pathlib import Path
from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver import Firefox
from webdriver_manager.microsoft import EdgeChromiumDriver
from webdriver_manager.chrome import ChromeDriverManager  # webdriver_manager.chrome import ChromeDriverManager
# from webdriver_manager.gecko import GeckoDriverManager  # .firefox import GeckoDriverManager


# from webdrivermanager.microsoft import EdgeChromiumDriverManager

ROBOT_LIBRARY_SCOPE = 'SUITE'


def get_manager_chrome_path():
    driver_path = ChromeDriverManager()._get_driver_path #.get_download_path()
    return driver_path


@keyword('open browser window')
def open_browser(browser='',url=''):
    ''' accept browser and url '''
    chrome_options = Options()
    chrome_options.add_argument('--disable-infobar')
    chrome_options.add_argument('--window-size=900,600')
    chrome_options.add_argument('--disable-blink-features=AutomationControlled')
    chrome_options.add_argument('--disable-extensions')

    if(browser.lower().__contains__('chrome') and url!=''):
        driver = webdriver.Chrome(executable_path=ChromeDriverManager().install(), options=chrome_options)
        driver.get(url)

    if (browser.lower().__contains__('chrome') and url == ''):
        driver = webdriver.Chrome(executable_path=ChromeDriverManager().install(), options=chrome_options)
        time.sleep(2)

    if (browser=='' and url == ''):
        raise Exception("Please provide at least browser name")


@keyword('open chrome with "${url}"')
def open_chrome_defaultProfile(url):
    
    user_dir = str(Path.home())+'/AppData/Local/Google/Chrome/User Data'
    print("using use-dir:"+user_dir)
    chrome_options = Options()
    
    #prefs = {"download.default_directory": "/some/path"}
    #adding Chrome Profile Path
    # chrome_options.add_argument('user-data-dir='+user_dir)
    # chrome_options.add_argument('--profile-directory=Profile 2')
    chrome_options.add_argument('--disable-infobar')
    chrome_options.add_argument('--window-size=900,600')
    chrome_options.add_argument('--disable-blink-features=AutomationControlled')
    chrome_options.add_argument('--disable-extensions')
    #options.headless = headless_mode

    driver = webdriver.Chrome(executable_path=ChromeDriverManager().install(),options=chrome_options)
    driver.get(url)
    time.sleep(2)
    
