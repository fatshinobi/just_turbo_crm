class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.text :about
      t.string :phone
      t.string :facebook
      t.string :twitter
      t.string :web
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
