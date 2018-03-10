json.extract! contact, :id, :fname, :lname, :name, :email, :phone, :mobile, :position, :source, :created_at, :updated_at
json.url contact_url(contact, format: :json)
