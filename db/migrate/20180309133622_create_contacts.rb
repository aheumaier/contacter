class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.string :name
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :position
      t.string :source

      t.belongs_to :company, index: true

      t.timestamps
    end
  end
end
