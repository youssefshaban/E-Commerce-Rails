require "application_system_test_case"

class CartCarriesTest < ApplicationSystemTestCase
  setup do
    @cart_carry = cart_carries(:one)
  end

  test "visiting the index" do
    visit cart_carries_url
    assert_selector "h1", text: "Cart Carries"
  end

  test "creating a Cart carry" do
    visit cart_carries_url
    click_on "New Cart Carry"

    click_on "Create Cart carry"

    assert_text "Cart carry was successfully created"
    click_on "Back"
  end

  test "updating a Cart carry" do
    visit cart_carries_url
    click_on "Edit", match: :first

    click_on "Update Cart carry"

    assert_text "Cart carry was successfully updated"
    click_on "Back"
  end

  test "destroying a Cart carry" do
    visit cart_carries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cart carry was successfully destroyed"
  end
end
