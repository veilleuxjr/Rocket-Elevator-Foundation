class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :admin_full_name
      t.string :admin_email
      t.string :admin_phone
      t.string :contact_technic_full_name
      t.string :contact_technic_email
      t.string :contact_technique_phone
      t.timestamps
    end
  end
end
