import pytest

from pages.search_results_page import SearchFlightsPage
from pages.flight_page import FlightFiltersPage
from pages.booking_flight_page import BookFlightPage
from pages.booking_details_page import BookingDetailsPage
from pages.payment_page import PaymentPage
from utilities.excel_reader import get_booking_data
from pages.invoice_page import InvoicePage


data = get_booking_data("C:/Users/vinod kumar/PycharmProjects/Final Capstone Project01/Final Capstone Project/testdata/booking_data.xlsx")


@pytest.mark.parametrize("row", data)
def test_flight_booking(setup, row):

    driver = setup

    search = SearchFlightsPage(driver)
    filters = FlightFiltersPage(driver)
    book = BookFlightPage(driver)
    details = BookingDetailsPage(driver)
    payment = PaymentPage(driver)
    invoice = InvoicePage(driver)

    search.enter_departure_city()
    search.enter_arrival_city()
    search.select_departure_date()

    search.select_round_trip()
    search.add_one_more_adult()
    search.select_return_date()

    search.click_search()

    filters.apply_stop_filters()
    filters.apply_departure_time_filters()
    filters.sort_by_duration()

    book.book_second_flight()

    # Excel user data
    details.fill_guest_details(row)
    details.fill_passenger_details(row)

    payment.select_payment_and_confirm()

    invoice.wait_for_invoice_page()
    invoice.download_invoice()
    invoice.verify_invoice_downloaded()