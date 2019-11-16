class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :company_name
      t.string :full_name
      t.string :phone
      t.string :email
      t.string :company_description
      t.string :full_name_of_technical_service
      t.string :phone_of_technical_service
      t.string :email_of_technical_service
      t.timestamps
    end
  end
end
