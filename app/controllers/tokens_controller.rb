class TokensController < ApplicationController
  def get
    render json: Token.generate_token
  end

  def check
    # token = Token.find_by(token: params[:token])
    # render json: token ? "TOKEN '#{token.token}' is valid" : "TOKEN '#{params[:token]}' isn't valid"
  end
end
