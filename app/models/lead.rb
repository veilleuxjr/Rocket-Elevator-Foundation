
class Lead < ApplicationRecord
    
    has_one :customer
    has_one_attached :file


end


