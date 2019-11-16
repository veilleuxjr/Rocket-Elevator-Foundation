require './lib/API/zendesk.rb'
class LeadsController < ApplicationController

    require "dropbox_api"
    skip_before_action :verify_authenticity_token

    def create
       
        @lead = Lead.new

        @lead.full_name = params['Name']
        @lead.company_name = params['Company']
        @lead.email = params['Email']
        @lead.phone = params['Phone']
        @lead.project_name = params['ProjectName']
        @lead.project_description = params['DepartmentInCharge']
        @lead.department_in_charge = params['ProjectDescription']
        @lead.message = params['Message']
        
        params_attach = params['Attachment']

        puts "params_attach #{params_attach}"
        
        
        if params_attach
            @lead.file = params_attach
            @lead.attachment_name = params_attach.original_filename
        end            
              
        @lead.save!
        contact_us(@lead)
        redirect_to quote_confirm_path
        
    end



 
    def contact_us(lead)
            zendesk = Zendesk.new
            zendesk.contact_us(lead.full_name, lead.company_name, lead.email, lead.phone, lead.department_in_charge, lead.project_name, lead.project_description, lead.message)

        LeadmailMailer.welcome_email(@lead).deliver
            @lead.save!
        

    end

end

