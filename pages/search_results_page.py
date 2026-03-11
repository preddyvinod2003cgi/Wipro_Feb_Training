from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class SearchFlightsPage:

    def __init__(self, driver):
        self.driver = driver
        self.wait = WebDriverWait(driver, 25)

        self.wait.until(
            EC.invisibility_of_element_located((By.ID, "page-loader"))
        )

    # ---------- LOCATORS ----------

    departure_input = (By.XPATH, "//input[@placeholder='Departure City or Airport']")
    arrival_input = (By.ID, "arrival_airport_input")

    bom_option = (By.XPATH, "//div[contains(text(),'Mumbai')]")
    del_option = (By.XPATH, "//span[contains(text(),'DEL')]")

    dep_date = (By.XPATH, "//td/div[text()='11']")

    flight_type = (By.XPATH, "/html/body/section/div[2]/div/div/form/div[3]/div[1]/div/div/div/span[2]")
    round_trip = (By.XPATH, "//span[normalize-space()='Round Trip']")

    passenger = (By.XPATH, "/html/body/section/div[2]/div/div/form/div[3]/div[2]/div[1]/div[1]")
    add_adult = (By.XPATH, "/html/body/section/div[2]/div/div/form/div[3]/div[2]/div[1]/div[2]/div[1]/div[2]/button[2]")

    return_input = (By.XPATH, "//input[@placeholder='Return Date']")

    search_button = (By.XPATH, "//button[contains(.,'Search Flights')]")

    flights_loaded = (By.XPATH, "//button[contains(.,'Book Now')]")

    # ---------- METHODS ----------

    def enter_departure_city(self):

        field = self.wait.until(EC.element_to_be_clickable(self.departure_input))
        field.click()
        field.send_keys("Bom")

        option = self.wait.until(EC.element_to_be_clickable(self.bom_option))
        option.click()

    def enter_arrival_city(self):

        field = self.wait.until(EC.element_to_be_clickable(self.arrival_input))
        field.click()
        field.send_keys("Del")

        option = self.wait.until(EC.element_to_be_clickable(self.del_option))
        option.click()

    def select_round_trip(self):

        dropdown = self.wait.until(EC.element_to_be_clickable(self.flight_type))
        dropdown.click()

        option = self.wait.until(EC.element_to_be_clickable(self.round_trip))
        option.click()

    def select_departure_date(self):

        date = self.wait.until(EC.element_to_be_clickable(self.dep_date))

        self.driver.execute_script("arguments[0].click();", date)

        self.driver.find_element(By.TAG_NAME, "body").click()

    def select_return_date(self):

        field = self.wait.until(
            EC.element_to_be_clickable(self.return_input)
        )
        field.click()

        # Correct calendar locator
        return_date = self.wait.until(
            EC.element_to_be_clickable(
                (By.XPATH, "(//td/div[text()='16'])[2]")
            )
        )

        self.driver.execute_script("arguments[0].click();", return_date)

        self.driver.find_element(By.TAG_NAME, "body").click()

    def add_one_more_adult(self):

        passenger = self.wait.until(
            EC.element_to_be_clickable(self.passenger)
        )
        passenger.click()

        add_btn = self.wait.until(
            EC.element_to_be_clickable(self.add_adult)
        )

        add_btn.click()

        self.driver.find_element(By.TAG_NAME, "body").click()

    def click_search(self):

        button = self.wait.until(
            EC.element_to_be_clickable(self.search_button)
        )

        button.click()

        self.wait.until(
            EC.presence_of_all_elements_located(self.flights_loaded)
        )