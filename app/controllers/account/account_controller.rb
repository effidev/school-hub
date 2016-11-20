module Account
  class AccountController < ApplicationController
    layout 'account'
    before_filter :authenticate_user!
  end
end
