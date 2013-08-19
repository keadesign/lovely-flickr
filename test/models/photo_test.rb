require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "search works" do
    photo = photos(:one)
    photo.title = "nice title"
    photo.save

    search_results = Photo.search_for "nice title"

    search_result_ids = search_results.map {|search_result| search_result.id }

    assert search_result_ids.include?(photo.id)
  end

  test "show should find a photo and render some HTML" do
    get :show, id: photos(:one).id
    assert_response :success
    assert assigns(:photo)
  end

  test "search works" do
    photo = photos(:one)
    photo.title = "nice title"
    photo.save

    search_results = Photo.search_for "nice title"
    search_result_ids = search_results.map {|search_result| search_result.id }
    assert search_result_ids.include?(photo.id)
  end
end
