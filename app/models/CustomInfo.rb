require 'net/http'

class CustomInfo
    class << self
        def get_rails_version
            `rails -v`.gsub(/[^\d.]/, '')
        end

        def get_ruby_version
            RUBY_VERSION
        end

        def get_github_contributors
            # https://github.com/BlinovA25/db-api.git/contributors
        end
    end
end
