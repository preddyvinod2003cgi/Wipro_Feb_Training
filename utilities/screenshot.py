import os
import time


def capture_screenshot(driver, name):

    folder = "screenshots"

    if not os.path.exists(folder):
        os.makedirs(folder)

    file_name = f"{name}_{int(time.time())}.png"

    path = os.path.join(folder, file_name)

    driver.save_screenshot(path)