class Customer < ApplicationRecord
    belongs_to :lead, optional: true
    has_many :buildings
    belongs_to :address
    belongs_to :user
    has_many :intervention
    after_update :dropbox

    def self.select_values
        Customer.all.map { |customer| [customer.full_name, customer.id, { data { url: data_url(customer)}}]}
    end

    private

    def self.data_url(customer)
        Rails.application.routes.url_helpers.customer_intervention_path(customer, format: :json)
    end


    def dropbox
        puts "******* DROPBOX *******"
        if self.lead   
            puts "******* #{self.lead.file} *******"        
            if self.lead.file != nil
                puts "WILL CALL DROPBOX"
                client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
                client.upload("/#{self.lead.full_name}/#{File.basename(self.lead.attachment_name)}", self.lead.file.blob.download)
                lead.attachment_name = nil
                lead.file.purge
                lead.save!
            end
        end
    end

end         
