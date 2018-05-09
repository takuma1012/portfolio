require 'test_helper'

class OffshotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get offshots_index_url
    assert_response :success
  end

end
