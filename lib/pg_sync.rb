require "pg"
require "yaml"

class PgSync
    
    attr_accessor :pg_connection, :host, :port, :dbname, :user, :password

    def initialize()
        self.read_postgres_params
        self.create_pg_connection
    end
    
    def read_postgres_params
        
        info = YAML::load(IO.read("./config/database_dwh.yml"))
        self.host = info[Rails.env]["host"]
        self.port = info[Rails.env]["port"]
        self.dbname = info[Rails.env]["database"]
        self.user = info[Rails.env]["username"]
        self.password = info[Rails.env]["password"]

    end

    def create_pg_connection

        self.pg_connection = PG::Connection.open(host: self.host, 
        port: self.port, 
        dbname: self.dbname, 
        user: self.user, 
        password: self.password)
    end
    
    def sync_quotes

        pg_connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            
            sql_string = "INSERT INTO fact_quotes(quote_id,creation_date,company_name,email,number_of_elevator) 
            VALUES (#{quote.id},'#{quote.created_at}','#{quote.company}','#{quote.email}','#{quote.estimate_cage_number}');"    
            self.pg_connection.exec(sql_string)    
        end
    end

    def sync_contact

        pg_connection.exec("TRUNCATE fact_contacts RESTART IDENTITY")      
        Lead.all.each do |lead| 
   
            sql_string =  "INSERT INTO fact_contacts(contact_id,creation_date,company_name,email,project_name)
            VALUES (#{lead.id},'#{lead.created_at}','#{lead.company_name}','#{lead.email}','#{lead.project_name}');"
            self.pg_connection.exec(sql_string) 
        end
    end

    def sync_elevator

        pg_connection.exec("TRUNCATE fact_elevators RESTART IDENTITY")   
        Elevator.all.each do |elevator|

            sql_string = "INSERT INTO fact_elevators (elevator_id,serial_number,initial_service_date,building_id,customer_id,city_of_building) 
            VALUES (#{elevator.id},'#{elevator.serial_number}','#{elevator.starting_service_date}','#{elevator.column.battery.building.id}','#{elevator.column.battery.building.customer.id}','#{elevator.column.battery.building.address.city}');"
            self.pg_connection.exec(sql_string) 
        end
     end

     def sync_dim_customers

        pg_connection.exec ("TRUNCATE dim_customers RESTART IDENTITY")
        Customer.all.each do |customer| 

            nbElevator = 0
            customer.buildings.all.each do |building|
               
                building.batteries.all.each do |battery|
                    
                    battery.columns.all.each do |column|
                      
                        nbElevator += column.elevators.count
                           
                    end
                end
            end
            sql_string = "INSERT INTO dim_customers (creation_date,company_name,company_contact_name,company_contact_email,number_elevators,client_city)
            VALUES ('#{customer.created_at}','#{customer.company_name}','#{customer.full_name}','#{customer.email}','#{nbElevator}','#{customer.address.city}');"
            self.pg_connection.exec(sql_string) 
        end
    end



end
