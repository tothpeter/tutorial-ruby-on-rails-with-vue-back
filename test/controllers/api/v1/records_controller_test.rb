require "test_helper"

class Api::V1::RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = records(:one)
  end

  test "should get index" do
    get api_v1_records_url, as: :json
    assert_response :success
  end

  test "should create record" do
    assert_difference('Record.count') do
      post api_v1_records_url, params: { record: { artist_id: @record.artist_id, title: @record.title, user_id: @record.user_id, year: @record.year } }, as: :json
    end

    assert_response 201
  end

  test "should show record" do
    get api_v1_record_url(@record), as: :json
    assert_response :success
  end

  test "should update record" do
    patch api_v1_record_url(@record), params: { record: { artist_id: @record.artist_id, title: @record.title, user_id: @record.user_id, year: @record.year } }, as: :json
    assert_response 200
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete api_v1_record_url(@record), as: :json
    end

    assert_response 204
  end
end
