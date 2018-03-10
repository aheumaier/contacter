json.extract! address, :id, :street, :city, :zip, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
