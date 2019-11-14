class Building < ApplicationRecord
 
    has_many :batteries, dependent: :destroy
    has_many :building_details, dependent: :destroy
    belongs_to :customer
    belongs_to :address, dependent: :destroy
    has_many :intervention

    def self.select_values
        Building.all.map { |building| [building.admin_full_name, building.id, { data { url: data_url(building)}}]}
    end

    private

    def self.data_url(building)
        Rails.application.routes.url_helpers.building_intervention_path(building, format: :json)
    end


    def company_name
    end
end
