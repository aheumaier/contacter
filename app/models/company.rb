class Company
  include Mongoid::Document

  field :name, type: String
  field :website, type: String
  field :vertical, type: String

  has_many :addresses, inverse_of: :company, dependent: :destroy
  accepts_nested_attributes_for :addresses, reject_if: :all_blank

end
