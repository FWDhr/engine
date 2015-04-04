module Locomotive
  module API

    class AccountForm < BaseForm

      attrs :name, :email, :locale, :api_key, :super_admin, :password, :password_confirmation

    end

  end
end