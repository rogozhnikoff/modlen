require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, line_item: { age: @line_item.age, biceps: @line_item.biceps, body: @line_item.body, chest: @line_item.chest, collar: @line_item.collar, crystal_amount: @line_item.crystal_amount, crystal_type: @line_item.crystal_type, elbow: @line_item.elbow, from_neck: @line_item.from_neck, height: @line_item.height, hips: @line_item.hips, model_name: @line_item.model_name, neck_circle: @line_item.neck_circle, order_id: @line_item.order_id, price: @line_item.price, product_id: @line_item.product_id, shoulder: @line_item.shoulder, size: @line_item.size, skirt: @line_item.skirt, sleeves: @line_item.sleeves, special_request: @line_item.special_request, to_skirt: @line_item.to_skirt, to_waist: @line_item.to_waist, units: @line_item.units, variant_id: @line_item.variant_id, waist: @line_item.waist, wrist: @line_item.wrist }
    end

    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { age: @line_item.age, biceps: @line_item.biceps, body: @line_item.body, chest: @line_item.chest, collar: @line_item.collar, crystal_amount: @line_item.crystal_amount, crystal_type: @line_item.crystal_type, elbow: @line_item.elbow, from_neck: @line_item.from_neck, height: @line_item.height, hips: @line_item.hips, model_name: @line_item.model_name, neck_circle: @line_item.neck_circle, order_id: @line_item.order_id, price: @line_item.price, product_id: @line_item.product_id, shoulder: @line_item.shoulder, size: @line_item.size, skirt: @line_item.skirt, sleeves: @line_item.sleeves, special_request: @line_item.special_request, to_skirt: @line_item.to_skirt, to_waist: @line_item.to_waist, units: @line_item.units, variant_id: @line_item.variant_id, waist: @line_item.waist, wrist: @line_item.wrist }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to line_items_path
  end
end
