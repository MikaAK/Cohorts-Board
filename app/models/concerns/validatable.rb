require 'active_support/concern'

module Validatable
  extend ActiveSupport::Concern

  included do
    validate :valid_phone

    def valid_phone
      if self.phone_number
        number = self.phone_number.gsub /\D/, ''
        errors.add(:invalid_phone, "Phone number must contain 9 digets") unless number =~ /\b\d{9,10}\b/
      end
    end
  end
end
