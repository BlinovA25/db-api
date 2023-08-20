class TgUsersController < ApplicationController
  before_action :check_token
  before_action :set_tg_user, only: %i[ show update destroy ]

  # GET /tg_users
  def index
    @tg_users = TgUser.all

    render json: @tg_users
  end

  # GET /tg_users/1
  def show
    render json: @tg_user
  end

  # POST /tg_users
  def create
    @tg_user = TgUser.new(tg_user_params)

    if @tg_user.save
      render json: @tg_user, status: :created, location: @tg_user
    else
      render json: @tg_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tg_users/1
  def update
    if @tg_user.update(tg_user_params)
      render json: @tg_user
    else
      render json: @tg_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tg_users/1
  def destroy
    @tg_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tg_user
      @tg_user = TgUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tg_user_params
      params.require(:tg_user).permit(:chat_id, :first_name, :last_name, :username, :is_bot, :language_code, :is_premium, :added_to_attachment_menu, :can_join_groups, :can_read_all_group_messages, :supports_inline_queries)
    end
end
