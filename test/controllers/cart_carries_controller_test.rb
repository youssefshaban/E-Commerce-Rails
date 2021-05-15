require 'test_helper'

class CartCarriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart_carry = cart_carries(:one)
  end

  test "should get index" do
    get cart_carries_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_carry_url
    assert_response :success
  end

  test "should create cart_carry" do
    assert_difference('CartCarry.count') do
      post cart_carries_url, params: { cart_carry: {  } }
    end

    assert_redirected_to cart_carry_url(CartCarry.last)
  end

  test "should show cart_carry" do
    get cart_carry_url(@cart_carry)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_carry_url(@cart_carry)
    assert_response :success
  end

  test "should update cart_carry" do
    patch cart_carry_url(@cart_carry), params: { cart_carry: {  } }
    assert_redirected_to cart_carry_url(@cart_carry)
  end

  test "should destroy cart_carry" do
    assert_difference('CartCarry.count', -1) do
      delete cart_carry_url(@cart_carry)
    end

    assert_redirected_to cart_carries_url
  end
end
