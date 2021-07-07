require "test_helper"

class Api::V1::ArtistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist = artists(:one)
  end

  test "should get index" do
    get api_v1_artists_url, as: :json
    assert_response :success
  end

  test "should create artist" do
    assert_difference('Artist.count') do
      post api_v1_artists_url, params: { artist: { name: @artist.name, user_id: @artist.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show artist" do
    get api_v1_artist_url(@artist), as: :json
    assert_response :success
  end

  test "should update artist" do
    patch api_v1_artist_url(@artist), params: { artist: { name: @artist.name, user_id: @artist.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy artist" do
    assert_difference('Artist.count', -1) do
      delete api_v1_artist_url(@artist), as: :json
    end

    assert_response 204
  end
end
