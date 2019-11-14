class Column < ApplicationRecord
    
    belongs_to :battery
    has_many :elevators, dependent: :destroy

    def company_name
        
    end
end
