require "test_helper"

class PartialsControllerTest < ActionDispatch::IntegrationTest
  test "should get _header" do
    get partials__header_url
    assert_response :success
  end

  test "should get _footer" do
    get partials__footer_url
    assert_response :success
  end
end
