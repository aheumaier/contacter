require 'csv'
require 'pp'
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


    CSV.generate(headers: true) do |csv|
      csv << Contact.column_names
      contacts.each do |contact|
        csv << contact.attributes.values_at(*column_names)
      end
    end
  end

end
