module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_current
  end

  def set_current
    Current.user = "session user"
    Current.account = 'Current.user.account'
  end
end