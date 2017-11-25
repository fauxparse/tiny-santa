class Address < ApplicationRecord
  belongs_to :santa

  %i[name line_1 line_2 suburb postcode city country].each do |attr|
    attr_encrypted attr, key: ENV['ENCRYPTION_KEY'], allow_empty_value: true
  end
end
