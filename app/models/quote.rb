require './lib/API/zendesk.rb'

class Quote < ApplicationRecord
    def quote()
        zendesk = Zendesk.new
        zendesk.quote(self.name,self.company,self.email,self.phone_number)
    end
end

