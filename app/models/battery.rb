class Battery < ApplicationRecord

belongs_to :building
belongs_to :employee
has_many :columns, dependent: :destroy
has_many :intervention

    def self.select_values
        Battery.all.map { |battery| [battery.operation_certificate, battery.id, { data { url: data_url(battery)}}]}
    end

    private

    def self.data_url(customer)
     Rails.application.routes.url_helpers.customer_intervention_path(customer, format: :json)
    end


    def company_name
    end

end

