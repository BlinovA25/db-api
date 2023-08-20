require "test_helper"

class TgUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tg_user = tg_users(:one)
  end

  test "should get index" do
    get tg_users_url, as: :json
    assert_response :success
  end

  test "should create tg_user" do
    assert_difference("TgUser.count") do
      post tg_users_url, params: { tg_user: { added_to_attachment_menu: @tg_user.added_to_attachment_menu, can_join_groups: @tg_user.can_join_groups, can_read_all_group_messages: @tg_user.can_read_all_group_messages, chat_id: @tg_user.chat_id, first_name: @tg_user.first_name, is_bot: @tg_user.is_bot, is_premium: @tg_user.is_premium, language_code: @tg_user.language_code, last_name: @tg_user.last_name, supports_inline_queries: @tg_user.supports_inline_queries, username: @tg_user.username } }, as: :json
    end

    assert_response :created
  end

  test "should show tg_user" do
    get tg_user_url(@tg_user), as: :json
    assert_response :success
  end

  test "should update tg_user" do
    patch tg_user_url(@tg_user), params: { tg_user: { added_to_attachment_menu: @tg_user.added_to_attachment_menu, can_join_groups: @tg_user.can_join_groups, can_read_all_group_messages: @tg_user.can_read_all_group_messages, chat_id: @tg_user.chat_id, first_name: @tg_user.first_name, is_bot: @tg_user.is_bot, is_premium: @tg_user.is_premium, language_code: @tg_user.language_code, last_name: @tg_user.last_name, supports_inline_queries: @tg_user.supports_inline_queries, username: @tg_user.username } }, as: :json
    assert_response :success
  end

  test "should destroy tg_user" do
    assert_difference("TgUser.count", -1) do
      delete tg_user_url(@tg_user), as: :json
    end

    assert_response :no_content
  end
end
