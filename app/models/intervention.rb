class Intervention < ApplicationRecord
    belongs_to :customer
    belongs_to :building
    belongs_to :battery
    belongs_to :column
    belongs_to :elevator
    belongs_to :employee

    def self.select_values(customer)
        return [] unless customer
        customer.intervention.pluck(:full_name, :id)
    end

    def self.self_values(building)
        return [] unless building
        building.pluck(:admin_full_name, :id)
    end

    def self.self_values(battery)
        return [] unless battery
        battery.pluck(:operation_certificate, :id)
    end

    def self.self_values(column)
        return [] unless column
        column.pluck(:id)
    end

    def self.select_values(elevator)
        return [] unless elevator
        elevator.pluck(:id)
    end

    def self.select_values(employee)
        return [] unless employee
        employee.pluck(:first_name, :id)
 

    def company_name

    end
end
