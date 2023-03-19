import sys, os, time

from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver import Firefox
from webdriver_manager.microsoft import EdgeChromiumDriver
from webdriver_manager.chrome import ChromeDriverManager  # webdriver_manager.chrome import ChromeDriverManager
# from webdriver_manager.gecko import GeckoDriverManager  # .firefox import GeckoDriverManager


# from webdrivermanager.microsoft import EdgeChromiumDriverManager


def open_ManagerChromeTest():
    driver = webdriver.Chrome(executable_path=ChromeDriverManager().install())
    driver.get("https://www.google.com/")
    time.sleep(2)
    driver.close()


# def open_ManagerFirefoxTest():
#     # driver_path = GeckoDriverManager().install()

#     driver = webdriver.Firefox(executable_path=GeckoDriverManager("0.29.0").install)

#     driver.get("https://www.bing.com/")
#     time.sleep(2)
#     driver.close()


def open_ManagerEdgeTest():
    driver = webdriver.Edge(executable_path=EdgeChromiumDriverManager().install())
    driver.get("https://www.yahoo.com/")
    time.sleep(2)
    driver.close()


def get_manager_chrome_path():
    driver_path = ChromeDriverManager()._get_driver_path #.get_download_path()
    return driver_path


@keyword("open ${browser_name} in headless mode")
def open_browser(browser_name):
    if(browser_name == "chrome"):

      # Options.add_argument("--headless")
      driver_path = ChromeDriverManager().get_download_path()
      return driver_path

# def get_manager_edge_path():
#     driver_path = EdgeChromiumDriverManager().install()
#     return driver_path

# open_ManagerChromeTest()
# open_ManagerFirefoxTest()
# open_ManagerEdgeTest()
