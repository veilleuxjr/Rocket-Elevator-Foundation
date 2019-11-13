class Building < ApplicationRecord
 
    has_many :batteries, dependent: :destroy
    has_many :building_details, dependent: :destroy
    belongs_to :customer
    belongs_to :address, dependent: :destroy

    def company_name
    end
end
