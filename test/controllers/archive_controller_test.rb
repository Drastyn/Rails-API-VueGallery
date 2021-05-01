require 'test_helper'

class ArchiveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get archive_index_url
    assert_response :success
  end

  test "should get show" do
    get archive_show_url
    assert_response :success
  end

  test "should get create" do
    get archive_create_url
    assert_response :success
  end

end
