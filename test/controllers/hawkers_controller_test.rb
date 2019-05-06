require 'test_helper'

class HawkersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hawkers_index_url
    assert_response :success
  end

  test "should get show" do
    get hawkers_show_url
    assert_response :success
  end

  test "should get new" do
    get hawkers_new_url
    assert_response :success
  end

  test "should get edit" do
    get hawkers_edit_url
    assert_response :success
  end

end
