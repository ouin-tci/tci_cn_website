require 'test_helper'

class NewLayoutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_layout_index_url
    assert_response :success
  end

end
