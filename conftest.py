import pytest
import os
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.chrome.options import Options


# ---------- BROWSER SETUP ----------

@pytest.fixture(scope="function")
def setup():

    chrome_options = Options()
    chrome_options.add_argument("--start-maximized")

    # downloads folder inside project root
    download_path = os.path.join(os.getcwd(), "downloads")

    # create downloads folder if not present
    os.makedirs(download_path, exist_ok=True)

    prefs = {
        "download.default_directory": download_path,
        "download.prompt_for_download": False,
        "download.directory_upgrade": True,
        "safebrowsing.enabled": True
    }

    chrome_options.add_experimental_option("prefs", prefs)

    driver = webdriver.Chrome(options=chrome_options)

    # open website
    driver.get("https://phptravels.net/flights")

    yield driver

    driver.quit()


# ---------- SCREENSHOT ON FAILURE ----------

@pytest.hookimpl(hookwrapper=True)
def pytest_runtest_makereport(item, call):

    outcome = yield
    report = outcome.get_result()

    if report.when == "call" and report.failed:

        driver = item.funcargs.get("setup", None)

        if driver:
            screenshot_dir = os.path.join("reports", "screenshots")

            os.makedirs(screenshot_dir, exist_ok=True)

            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

            screenshot_file = os.path.join(
                screenshot_dir,
                report.nodeid.replace("::", "_") + "_" + timestamp + ".png"
            )

            driver.save_screenshot(screenshot_file)

            print(f"\nScreenshot saved: {screenshot_file}")