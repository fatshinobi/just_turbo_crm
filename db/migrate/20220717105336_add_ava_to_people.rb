class AddAvaToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :ava, :string
  end
end
