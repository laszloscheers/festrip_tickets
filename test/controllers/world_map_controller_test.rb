require "test_helper"

class WorldMapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get world_map_index_url
    assert_response :success
  end
end
