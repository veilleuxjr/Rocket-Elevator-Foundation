class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.date :creation_date
      t.string :company_name
      t.string :company_contact_name
      t.string :company_contact_email
      t.integer :number_elevators
      t.string :client_city
    end
  end
end
