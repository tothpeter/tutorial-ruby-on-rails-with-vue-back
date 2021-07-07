require "test_helper"

class Api::V1::RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_record = records(:one)
  end

  test "should get index" do
    get api_v1_records_url, as: :json
    assert_response :success
  end

  test "should create api_v1_record" do
    assert_difference('Record.count') do
      post api_v1_records_url, params: { api_v1_record: { artist_id: @api_v1_record.artist_id, title: @api_v1_record.title, user_id: @api_v1_record.user_id, year: @api_v1_record.year } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_record" do
    get api_v1_record_url(@api_v1_record), as: :json
    assert_response :success
  end

  test "should update api_v1_record" do
    patch api_v1_record_url(@api_v1_record), params: { api_v1_record: { artist_id: @api_v1_record.artist_id, title: @api_v1_record.title, user_id: @api_v1_record.user_id, year: @api_v1_record.year } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_record" do
    assert_difference('Record.count', -1) do
      delete api_v1_record_url(@api_v1_record), as: :json
    end

    assert_response 204
  end
end
