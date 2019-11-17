
require 'zendesk_api' 
class Zendesk
    def initialize
        
        @client = ZendeskAPI::Client.new do |config|
            # Mandatory:

            config.url = "https://rocketconsolidationhelp.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

            # Basic / Token Authentication
            config.username = "jeremieveilleux99@gmail.com"

            # Choose one of the following depending on your authentication choice
            config.token = ENV['ZENDESK_TOKEN']
            config.retry = true
        end
    end

    def contact_us(full_name, company_name, email, phone, department_in_charge, project_name, project_description, message)
      puts "---------------------------"
      puts full_name
      puts "---------------------------"
   
      ticket = ZendeskAPI::Ticket.create(@client, :subject => "#{full_name} from #{company_name}", :decription => "Create Ticket", :comment => { :value => "The contact #{full_name} from company #{company_name} can be reached at email #{email} and at phone number #{phone}. #{department_in_charge} has a project named #{project_name} which would require contribution from Rocket Elevators.\n#{project_description}\nAttached Message: #{message}\nThe Contact uploaded an attachment."}, :submitter_id => @client.current_user.id, :type => "question", :priority => "urgent")
    #   ticket.save!
    end
    
    def quote(name, company, email, phone_number)
       ticket = ZendeskAPI::Ticket.create(@client, :subject => "#{name} from #{company}", :decription => "Create Ticket", :comment => { :value => "The contact #{name} from company #{company} can be reached at email #{email} and at phone number #{phone_number}."}, :submitter_id => @client.current_user.id, :type => "task", :priority => "urgent")
    #    ticket.save!
    end    

    def quote(name, company, email, phone_number)
        ticket = ZendeskAPI::Ticket.create(@client, :subject => "#{name} from #{company}", :decription => "Create Ticket", :comment => { :value => "The contact #{name} from company #{company} can be reached at email #{email} and at phone number #{phone_number}."}, :submitter_id => @client.current_user.id, :type => "task", :priority => "urgent")
     #    ticket.save!
    end    
       
    def get_an_intervention(customer_info, building_nb, address_number, address_city, battery_nb, column_nb, elevator_nb, employee_name, employee_lastname)
        ZendeskAPI::Ticket.create(@client, :subject => "Intervention for #{customer_info}", :decription => "Intervention needed", :comment => { :value =>"An administrater sent an intervention request for the company #{customer_info} regarding the building #{building_nb} #{address_number} in #{address_city}. There is a problem with either the battery #{battery_nb}, the column #{column_nb} or the elevator #{elevator_nb}, which would require support from Rocket Elevators."}, :submitter_id => @client.current_user.id, :type => "question", :priority => "urgent")
    end 

end
