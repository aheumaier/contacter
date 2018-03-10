# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

quote_chars = %w(" | ~ ^ & *)

CSV.foreach('/home/aheumaier/Downloads/contacs.csv', { :col_sep => ',', headers: :first_row, quote_char: quote_chars.shift }) do |row|

  begin
    company = Company.find_or_create_by( :name => row[4])
    address = Address.find_by_street(row[23])
    unless (row[23].to_s.length == 0) || (address != nil)
      company.update!(
          :website => row[5],
          :vertical => row[27],
          :addresses_attributes => {
              "1" => {
                  :description => 'business address',
                  :city => row[25],
                  :zip => row[24],
                  :street => row[23],
                  :country => row[26]
              }
          }
      )
    else
      company.update!(
          :website => row[5],
          :vertical => row[27]
      )
    end


  rescue ActiveRecord::RecordNotUnique
    puts "Info duplicate skipped: " + row.to_s
  end



  begin
    contact = Contact.find_or_create_by( :email => row[19])
    contact.update!(
        :fname => row[9],
        :lname => row[10],
        :name => row[12],
        :email => row[19],
        :phone => row[17],
        :mobile => row[15],
        :position => row[14],
        :source => row[0],
        :company_id => company.id
    )
  rescue ActiveRecord::RecordNotUnique
    puts "Info duplicate skipped: "+row.to_s
  end


end
