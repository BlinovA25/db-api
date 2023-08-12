require 'CustomInfo.rb'

class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def check_token
    render json: "Verification fault. Token is incorrect or inpired!" unless Token.find_by(token: params[:token])&.check
  end

  def info
    render json:
             {
               rails_version: CustomInfo.get_rails_version,
               ruby_vesion: CustomInfo.get_ruby_version,
               contributors: 'Anton'
             }
  end

  def session_info
    render json:
             {
               ip: request.remote_ip,
               token: 'Coming soon...'
             }
  end
end
