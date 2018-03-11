class Address
  include Mongoid::Document

  belongs_to :company, inverse_of: :addresses


  field :description, type: String
  field :street, type: String
  field :city, type: String
  field :zip, type: String
  field :country, type: String

end
