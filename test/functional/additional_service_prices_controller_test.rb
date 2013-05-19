require 'test_helper'

class AdditionalServicePricesControllerTest < ActionController::TestCase
  setup do
    @additional_service_price = additional_service_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:additional_service_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create additional_service_price" do
    assert_difference('AdditionalServicePrice.count') do
      post :create, additional_service_price: { additional_service_id: @additional_service_price.additional_service_id, flat: @additional_service_price.flat, per_sq: @additional_service_price.per_sq, vendoir_if: @additional_service_price.vendoir_if }
    end

    assert_redirected_to additional_service_price_path(assigns(:additional_service_price))
  end

  test "should show additional_service_price" do
    get :show, id: @additional_service_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @additional_service_price
    assert_response :success
  end

  test "should update additional_service_price" do
    put :update, id: @additional_service_price, additional_service_price: { additional_service_id: @additional_service_price.additional_service_id, flat: @additional_service_price.flat, per_sq: @additional_service_price.per_sq, vendoir_if: @additional_service_price.vendoir_if }
    assert_redirected_to additional_service_price_path(assigns(:additional_service_price))
  end

  test "should destroy additional_service_price" do
    assert_difference('AdditionalServicePrice.count', -1) do
      delete :destroy, id: @additional_service_price
    end

    assert_redirected_to additional_service_prices_path
  end
end
