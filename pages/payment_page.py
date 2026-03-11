from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

class PaymentPage:

    def __init__(self,driver):
        self.driver=driver
        self.wait=WebDriverWait(driver,25)

    def select_payment_and_confirm(self):

        self.driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
        time.sleep(2)

        pay_later=self.wait.until(
            EC.element_to_be_clickable(
                (By.XPATH,"//div[contains(text(),'Pay Later')]")
            )
        )

        self.driver.execute_script("arguments[0].click();",pay_later)
        time.sleep(2)

        terms=self.wait.until(
            EC.element_to_be_clickable(
                (By.XPATH,"//label[contains(text(),'I agree to the')]")
            )
        )

        self.driver.execute_script("arguments[0].scrollIntoView({block:'center'});",terms)
        self.driver.execute_script("arguments[0].click();",terms)

        confirm=self.wait.until(
            EC.element_to_be_clickable(
                (By.XPATH,"//span[normalize-space()='Confirm Booking']")
            )
        )

        self.driver.execute_script("arguments[0].click();",confirm)