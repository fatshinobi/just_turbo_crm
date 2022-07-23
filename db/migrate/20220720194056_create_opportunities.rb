class CreateOpportunities < ActiveRecord::Migration[7.0]
  def change
    create_table :opportunities do |t|
      t.string :title
      t.date :start
      t.date :finish
      t.text :description
      t.integer :stage
      t.integer :status
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
