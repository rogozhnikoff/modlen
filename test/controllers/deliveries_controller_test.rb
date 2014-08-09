require 'test_helper'

class DeliveriesControllerTest < ActionController::TestCase
  setup do
    @delivery = deliveries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deliveries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery" do
    assert_difference('Delivery.count') do
      post :create, delivery: { city: @delivery.city, country: @delivery.country, deadline: @delivery.deadline, delivery_date: @delivery.delivery_date, email: @delivery.email, full_name: @delivery.full_name, git_box: @delivery.git_box, info: @delivery.info, speed: @delivery.speed, state: @delivery.state, street: @delivery.street, tel: @delivery.tel, zip: @delivery.zip }
    end

    assert_redirected_to delivery_path(assigns(:delivery))
  end

  test "should show delivery" do
    get :show, id: @delivery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery
    assert_response :success
  end

  test "should update delivery" do
    patch :update, id: @delivery, delivery: { city: @delivery.city, country: @delivery.country, deadline: @delivery.deadline, delivery_date: @delivery.delivery_date, email: @delivery.email, full_name: @delivery.full_name, git_box: @delivery.git_box, info: @delivery.info, speed: @delivery.speed, state: @delivery.state, street: @delivery.street, tel: @delivery.tel, zip: @delivery.zip }
    assert_redirected_to delivery_path(assigns(:delivery))
  end

  test "should destroy delivery" do
    assert_difference('Delivery.count', -1) do
      delete :destroy, id: @delivery
    end

    assert_redirected_to deliveries_path
  end
end
