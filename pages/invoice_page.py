import os
import time

from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class InvoicePage:

    def __init__(self, driver):
        self.driver = driver
        self.wait = WebDriverWait(driver, 40)

    # ---------- LOCATOR ----------
    download_invoice_button = (
        By.XPATH,
        "//div[@class='btn light w-full flex items-center justify-start gap-2 cursor-pointer']"
    )

    # ---------- WAIT FOR INVOICE PAGE ----------
    def wait_for_invoice_page(self):

        self.wait.until(
            EC.visibility_of_element_located(self.download_invoice_button)
        )

        print("Invoice page loaded successfully")

    # ---------- DOWNLOAD INVOICE ----------
    def download_invoice(self):

        button = self.wait.until(
            EC.element_to_be_clickable(self.download_invoice_button)
        )

        self.driver.execute_script(
            "arguments[0].scrollIntoView({block:'center'});",
            button
        )

        self.driver.execute_script("arguments[0].click();", button)

        print("Invoice download clicked")

        time.sleep(5)   # allow download to start

    # ---------- VERIFY DOWNLOAD ----------
    def verify_invoice_downloaded(self):

        # project downloads folder
        downloads_folder = os.path.join(os.getcwd(), "downloads")

        timeout = 15
        start_time = time.time()

        while True:

            files = os.listdir(downloads_folder)

            invoice_files = [f for f in files if f.endswith(".pdf")]

            if invoice_files:
                print("Invoice downloaded successfully:", invoice_files[-1])
                return

            if time.time() - start_time > timeout:
                raise AssertionError("Invoice file NOT downloaded")

            time.sleep(1)