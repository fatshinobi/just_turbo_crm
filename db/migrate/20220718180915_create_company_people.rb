class CreateCompanyPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :company_people do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
