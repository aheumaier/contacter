class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change

    add_index :contacts, :lname
    add_index :contacts, :email

    add_index :companies, :name

    add_index :addresses, :city
    add_index :addresses, :zip

  end
end
