
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create!(email: "nicolas.genest@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(6.years.ago, 5.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
User.create!(email: "david.boutin@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
User.create!(email: "remi.gagnon@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
User.create!(email: "mathieu.lefrancois@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
User.create!(email: "mathieu.lortie@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
User.create!(email: "mathieu.houde@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
User.create!(email: "serge.savoie@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
User.create!(email: "nadya.fortier@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
User.create!(email: "martin.chantal@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true, created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))

100.times do
    User.create!(
        email: Faker::Internet.email,
        password: '123456',
        created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end

Employee.create!(first_name: 'Nicolas', last_name: 'Genest', title: 'Comm.Rep', email: 'nicolas.genest@codeboxx.biz', password: '123456', user_id: '1', created_at: Faker::Time.between(6.years.ago, 5.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
Employee.create!(first_name: 'David', last_name: 'Boutin', title: 'Engineer', email: 'david.boutin@codeboxx.biz', password: '123456', user_id: '2', created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
Employee.create!(first_name: 'Remi', last_name: 'Gagnon', title: 'Engineer', email: 'remi.gagnon@codeboxx.biz', password: '123456', user_id: '3', created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
Employee.create!(first_name: 'Mathieu', last_name: 'LeFrançois', title: 'Engineer', email: 'mathieu.lefrancois@codeboxx.biz', password: '123456', user_id: '4', created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
Employee.create!(first_name: 'Mathieu', last_name: 'Lortie', title: 'Engineer', email: 'mathieu.lortie@codeboxx.biz', password: '123456', user_id: '5', created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
Employee.create!(first_name: 'Mathieu', last_name: 'Houde', title: 'Engineer', email: 'mathieu.houde@codeboxx.biz', password: '123456', user_id: '6', created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
Employee.create!(first_name: 'Serge', last_name: 'Savoie', title: 'Engineer', email: 'serge.savoie@codeboxx.biz', password: '123456', user_id: '7', created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
Employee.create!(first_name: 'Nadya', last_name: 'Fortier', title: 'Director', email: 'nadya.fortier@codeboxx.biz', password: '123456', user_id: '8', created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
Employee.create!(first_name: 'Martin', last_name: 'Chantal', title: 'Engineer', email: 'martin.chantal@codeboxx.biz', password: '123456', user_id: '9', created_at: Faker::Time.between(5.years.ago, 4.years.ago, :all),  updated_at: Faker::Time.between(2.years.ago, Time.now, :all))
 
user_id_array = [*21..99]

43.times do 
    Employee.create!(

        first_name: Faker::Name.first_name.delete("\'"),
        last_name: Faker::Name.last_name.delete("\'"),
        title: Faker::Construction.role,     
        email: Faker::Internet.email,
        password: '123456',
        user_id: user_id_array.delete(user_id_array.sample),
        created_at: Faker::Time.between(4.years.ago, 7.months.ago, :all),
        updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end

40.times do
    Lead.create!(

        full_name: Faker::Name.name.delete("\'"),
        company_name: Faker::Company.name.delete("\'"),
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        project_name: Faker::Company.industry,
        project_description: Faker::Company.type,
        department_in_charge: Faker::Commerce.department,
        message: Faker::Construction.subcontract_category,
        created_at: Faker::Time.between(5.months.ago, Time.now, :all),
        updated_at: Faker::Time.between(2.weeks.ago, Time.now, :all)
    )
end

    status_array = ["Active", "Active", "Active", "Inactive", "Intervention"]
    type_of_building_array = ["Residential", "Commercial", "Corporative", "Hybrid"]
    type_of_service_array = ["Standard", "Premium", "Excelium"]

    csv_text = File.read(Rails.root.join('lib', 'seed', 'address1.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
           t = Address.new
           t. type_of_address = row['type_of_address']
           t.status = row['status']
           t.entity = row['entity']
           t.number_and_street = row['number_and_street']
           t.appartment_or_suit = row['appartment_or_suit']
           t.city = row['city']
           t.zip_code = row['zip_code']
           t.country = row['country']
           t.notes = row['notes']
           t.created_at = row['created_at']
           t.updated_at = row['updated_at']
           t.save!
    end

    address_id_array = [*1..10]
    user_id_array = [*11..20]
    lead_id_array = [*1..40]

10.times do
    Customer.create!(

        company_name: Faker::Company.name.delete("\'"),
        full_name: Faker::Name.name.delete("\'"),
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        company_description:  Faker::Company.type,
        full_name_of_technical_service: Faker::Company.name.delete("\'"),
        phone_of_technical_service: Faker::PhoneNumber.phone_number,
        email_of_technical_service: Faker::Internet.email,
        address_id: address_id_array.delete(address_id_array.sample),
        user_id: user_id_array.delete(user_id_array.sample),
        created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end

    address_id_array = [*11..25]
    customer_id_array = [*1..10]

10.times do
    Building.create!(

        admin_full_name: Faker::Name.first_name.delete("\'"),
        admin_email: Faker::Internet.email,
        admin_phone: Faker::PhoneNumber.phone_number,
        contact_technic_full_name: Faker::Name.name.delete("\'"),
        contact_technic_email: Faker::Internet.email,
        contact_technique_phone: Faker::PhoneNumber.phone_number,
        customer_id: customer_id_array.delete(customer_id_array.sample), 
        address_id: address_id_array.delete(address_id_array.sample),
        created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end

    customer_id_array = [*1..10]

5.times do
    Building.create!(

        admin_full_name: Faker::Name.first_name.delete("\'"),
        admin_email: Faker::Internet.email,
        admin_phone: Faker::PhoneNumber.phone_number,
        contact_technic_full_name: Faker::Name.name.delete("\'"),
        contact_technic_email: Faker::Internet.email,
        contact_technique_phone: Faker::PhoneNumber.phone_number,
        customer_id: customer_id_array.sample,
        address_id: address_id_array.delete(address_id_array.sample),
        created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end

    building_id_array = [*1..15]

15.times do
    BuildingDetail.create!(

        information_key: Faker::Types.rb_string,
        value: Faker::Types.rb_string,
        building_id: building_id_array.delete(building_id_array.sample),
        created_at: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        updated_at: Faker::Time.between(6.months.ago, Time.now, :all)
    )
end

    building_id_array = [*1..15]
    employee_id_array = [*11..52]

15.times do
    Battery.create!(

        type_of_battery: type_of_building_array.sample,
        status: status_array.sample,
        starting_service_date: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        last_inspection_date: Faker::Time.between(1.year.ago, 1.week.ago, :all),
        operation_certificate: Faker::Code.isbn,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        building_id: building_id_array.delete(building_id_array.sample),
        employee_id: employee_id_array.delete(employee_id_array.sample)
    )
end

    battery_id_array =[*1..15]

15.times do
    Column.create!(

        type_of_column: type_of_building_array.sample,
        number_of_floors_served: Faker::Number.number(2),
        status: status_array.sample,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        battery_id: battery_id_array.delete(battery_id_array.sample)
    )
end

    battery_id_array =[*1..15]  

60.times do
    Column.create!(

        type_of_column: type_of_building_array.sample,
        number_of_floors_served: Faker::Number.number(2),
        status: status_array.sample,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        battery_id: battery_id_array.sample
    )
end

    column_id_array =[*1..75]

75.times do
    Elevator.create!(

        serial_number: Faker::Code.isbn,
        model: type_of_service_array.sample,
        type_of_building: type_of_building_array.sample,
        status: status_array.sample,
        starting_service_date: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        last_inspection_date: Faker::Time.between(1.year.ago, 1.week.ago, :all),
        inspection_certificate: Faker::Code.isbn,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        column_id: column_id_array.delete(column_id_array.sample)
    )
end

    column_id_array =[*1..75]

225.times do
    Elevator.create!(

        serial_number: Faker::Code.isbn,
        model: type_of_service_array.sample,
        type_of_building: type_of_building_array.sample,
        status: status_array.sample,
        starting_service_date: Faker::Time.between(3.years.ago, 7.months.ago, :all),
        last_inspection_date: Faker::Time.between(1.year.ago, 1.week.ago, :all),
        inspection_certificate: Faker::Code.isbn,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        column_id: column_id_array.sample
    )
end


75.times do
    Quote.create!(

        name: Faker::Name.name.delete("\'"),
        company: Faker::Company.name.delete("\'"),
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.phone_number,
        type_of_building: type_of_building_array.sample,
        apartments_number: Faker::Number.number(2),
        floors_number: Faker::Number.number(2),
        undergrounds_number: Faker::Number.number(2),
        stores_number: Faker::Number.number(2),
        cage_number: Faker::Number.number(2),
        parking_places: Faker::Number.number(2),
        companies_number: Faker::Number.number(2),
        occupants_per_floor: Faker::Number.number(2),
        open_hours: Faker::Number.number(2),
        estimate_cage_number: Faker::Number.number(2),
        range_of_elevator: type_of_service_array.sample,
        unit_price: Faker::Commerce.price(),
        elevator_price: Faker::Commerce.price(),
        installation_cost: Faker::Commerce.price(),
        total_price: Faker::Commerce.price(),
        created_at: Faker::Time.between(6.months.ago, 2.weeks.ago, :all),
        updated_at: Faker::Time.between(2.weeks.ago, Time.now, :all)
    )
end