require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    @list = lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post :create, list: { end_date: @list.end_date, govt_id: @list.govt_id, locations: @list.locations, maximum: @list.maximum, minimum: @list.minimum, organization_name: @list.organization_name, position: @list.position, position_title: @list.position_title, rate_interval_code: @list.rate_interval_code, start_date: @list.start_date, url: @list.url }
    end

    assert_redirected_to list_path(assigns(:list))
  end

  test "should show list" do
    get :show, id: @list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list
    assert_response :success
  end

  test "should update list" do
    patch :update, id: @list, list: { end_date: @list.end_date, govt_id: @list.govt_id, locations: @list.locations, maximum: @list.maximum, minimum: @list.minimum, organization_name: @list.organization_name, position: @list.position, position_title: @list.position_title, rate_interval_code: @list.rate_interval_code, start_date: @list.start_date, url: @list.url }
    assert_redirected_to list_path(assigns(:list))
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete :destroy, id: @list
    end

    assert_redirected_to lists_path
  end
end
