class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :vertical

      t.timestamps
    end
  end
end
