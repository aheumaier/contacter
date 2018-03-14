require 'csv'

class Contact < ApplicationRecord

  belongs_to :company

  #scope :by_company, -> { where("user_id = ?", @id )}

  def self.contacts_by_company hash = {}
    res = Contact.select("COUNT(*) AS count_all, `contacts`.`company_id` AS contacts_company_id").group("contacts_company_id" ).having("count_all > 10").order("count_all DESC").limit("25")
    res.to_a.each do |row|
      company_name = Company.find_by_id(row.contacts_company_id).name
      hash[company_name] = row.count_all.to_i
    end
    return hash
  end

  def self.to_csv contacts
    column_names1 = ["id", "fname", "lname", "name", "email", "phone", "mobile", "position", "source"]
    column_names2 = ["name", "website", "vertical"]
    column_names3 = ["street", "city", "zip", "country"]

    CSV.generate(headers: true) do |csv|
      csv << (column_names1+column_names2+column_names3)
      contacts.each do |contact|
        con = contact.attributes.values_at(*column_names1)
        com = contact.company.attributes.values_at(*column_names2)
        addr = if  (contact.company.addresses.empty?)
                 addr = []
               else
                 contact.company.addresses.first.attributes.values_at(*column_names3)
               end
        csv << (con + com + addr||'')
      end
    end
  end

end
