require 'CustomInfo.rb'

class ApplicationController < ActionController::API

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

    # def check_token
    # end

end
