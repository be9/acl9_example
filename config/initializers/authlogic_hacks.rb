# adapted from authlogic-1.3.9/lib/authlogic/session/cookies.rb

module Authlogic
  module Session
    module Cookies
      def save_cookie
        controller.cookies[cookie_key] = {
          :value => record.send(persistence_token_field),
          :expires => remember_me_until,
          :domain => cookie_domain
        }
      end
  
      def destroy_cookie
        controller.cookies.delete cookie_key, :domain => cookie_domain
      end

      private 

      def cookie_domain
        ActionController::Base.session_options[:session_domain]
      end
    end
  end
end
