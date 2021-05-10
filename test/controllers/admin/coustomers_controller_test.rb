require 'test_helper'

class Admin::CoustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_coustomers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_coustomers_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_coustomers_update_url
    assert_response :success
  end

end
