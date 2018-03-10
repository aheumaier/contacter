class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :street
      t.string :city
      t.string :zip
      t.string :country

      t.belongs_to :company, index: true



      t.timestamps
    end
  end
end
