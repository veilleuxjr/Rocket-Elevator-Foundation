class Column < ApplicationRecord
    
    belongs_to :battery
    has_many :elevators, dependent: :destroy
    has_many :intervention

    def self.select_values
        Column.all.map { |column| [column.id, column.id, { data { url: data_url(column)}}]}
    end

    private

    def self.data_url(column)
        Rails.application.routes.url_helpers.column_intervention_path(column, format: :json)
    end

    def company_name
        
    end
end
