require 'test_helper'

class MailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mails_index_url
    assert_response :success
  end

end
