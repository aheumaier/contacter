class Address < ApplicationRecord
  belongs_to :company, inverse_of: :addresses
end
