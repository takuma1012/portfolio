require 'test_helper'

class CdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cds_index_url
    assert_response :success
  end

  test "should get new" do
    get cds_new_url
    assert_response :success
  end

  test "should get edit" do
    get cds_edit_url
    assert_response :success
  end

end
