class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :type_of_address
      t.string :status
      t.string :entity
      t.string :number_and_street
      t.string :appartment_or_suit
      t.string :city
      t.string :zip_code
      t.string :country
      t.text :notes
      t.timestamps
    end
  end
end
