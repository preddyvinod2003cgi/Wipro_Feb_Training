from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class BookFlightPage:

    def __init__(self, driver):
        self.driver = driver
        self.wait = WebDriverWait(driver, 25)

    # ---------- LOCATORS (same as your code) ----------

    flights_loaded = (By.XPATH, "//button[contains(.,'Book Now')]")

    second_flight_book = (
        By.XPATH,
        "//div[@class='space-y-4 relative z-0']//div[2]//div[1]//div[1]//div[2]//div[1]//div[4]//button[1]"
    )

    # ---------- METHOD ----------

    def book_second_flight(self):

        # wait until flight results appear
        self.wait.until(
            EC.presence_of_all_elements_located(self.flights_loaded)
        )

        # wait for second flight button
        second_flight = self.wait.until(
            EC.element_to_be_clickable(self.second_flight_book)
        )

        # scroll to element
        self.driver.execute_script(
            "arguments[0].scrollIntoView({block:'center'});",
            second_flight
        )

        # click Book Now
        self.driver.execute_script(
            "arguments[0].click();",
            second_flight
        )