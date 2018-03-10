json.extract! company, :id, :name, :website, :city, :zip, :country, :vertical, :created_at, :updated_at
json.url company_url(company, format: :json)
