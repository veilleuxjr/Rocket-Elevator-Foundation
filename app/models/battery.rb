class Battery < ApplicationRecord

belongs_to :building
belongs_to :employee
has_many :columns, dependent: :destroy


    def company_name
    end

end

