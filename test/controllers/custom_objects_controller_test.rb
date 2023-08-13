require "test_helper"

class CustomObjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_object = custom_objects(:one)
  end

  test "should get index" do
    get custom_objects_url, as: :json
    assert_response :success
  end

  test "should create custom_object" do
    assert_difference("CustomObject.count") do
      post custom_objects_url, params: { custom_object: { data: @custom_object.data, owner: @custom_object.owner } }, as: :json
    end

    assert_response :created
  end

  test "should show custom_object" do
    get custom_object_url(@custom_object), as: :json
    assert_response :success
  end

  test "should update custom_object" do
    patch custom_object_url(@custom_object), params: { custom_object: { data: @custom_object.data, owner: @custom_object.owner } }, as: :json
    assert_response :success
  end

  test "should destroy custom_object" do
    assert_difference("CustomObject.count", -1) do
      delete custom_object_url(@custom_object), as: :json
    end

    assert_response :no_content
  end
end
