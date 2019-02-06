module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :room_id
    def connect
      # ここのキーはシンボルではなく文字列でなければ値を取れない
      # cookieの仕様？ http://higan96.hatenablog.com/entry/2014/05/12/131157
      self.room_id = session['room_id']
    end
    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end
=begin
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      if verified_user = User.find_by(id: session['user_id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end
=end
  end
end
