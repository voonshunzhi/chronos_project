require 'test_helper'

class HealthRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get health_records_index_url
    assert_response :success
  end

  test "should get show" do
    get health_records_show_url
    assert_response :success
  end

  test "should get create" do
    get health_records_create_url
    assert_response :success
  end

  test "should get update" do
    get health_records_update_url
    assert_response :success
  end

end
