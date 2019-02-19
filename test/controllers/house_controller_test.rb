require 'test_helper'

class HouseControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get house_index_url
    assert_response :success
  end

  test "should get show" do
    get house_show_url
    assert_response :success
  end

end
