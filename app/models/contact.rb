class Contact
  include Mongoid::Document
  include Mongoid::FullTextSearch

  belongs_to :company

  field :fname, type: String
  field :lname, type: String
  field :name, type: String
  field :name, type: String
  field :email, type: String
  field :phone, type: String
  field :mobile, type: String
  field :position, type: String
  field :source, type: String

  fulltext_search_in :name, :email



  def self.contacts_by_company hash = {}
    # res = Contact.all #select("COUNT(*) AS count_all, `contacts`.`company_id` AS contacts_company_id").group("contacts_company_id" ).having("count_all > 10").order("count_all DESC").limit("25")
    # res.to_a.each do |row|
    #   company_name = Company.find_by_id(row.contacts_company_id).name
    #   hash[company_name] = row.count_all.to_i
    # end
    return hash
  end


end
