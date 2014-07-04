require 'active_support/concern'

module Authenticatable
  extend ActiveSupport::Concern

  included do
    def self.authorize_key(uuid)
      begin
        self.find_by uuid: uuid
      rescue ActiveRecord::StatementInvalid
      end
    end
  end
end
