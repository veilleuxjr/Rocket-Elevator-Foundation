class GoogleController < ApplicationController

     before_action :authenticate_user!

    def index    
        
        @marker_list = []
          
         Building.all.each do |b|
            building_address = b.address
            full_address = building_address.number_and_street + " " + building_address.city + " " + building_address.zip_code 

            resp = JSON.parse(Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{full_address}&key=#{ENV['GMAP2']}").body)

            pp resp
            
                latitude = resp['results'][0]['geometry']['location']['lat'] 
                longitude = resp['results'][0]['geometry']['location']['lng'] 


                 @wet = JSON.parse(Faraday.get("http://api.openweathermap.org/data/2.5/weather?lat=#{latitude}&lon=#{longitude}&appid=#{ENV['GMAP3']}&units=metric").body)

                 pp @wet
                 temperature = @wet['main']['temp'] 
                 min = @wet['main']['temp_min'] 
                 max = @wet['main']['temp_max'] 
                 pressure = @wet['main']['pressure']
                 humidity = @wet['main']['humidity']
                
                 bat_ids = b.battery_ids
                 col_ids = Column.where(battery_id: b.battery_ids).ids
                @marker_list << {
                    lat: latitude,
                    lng: longitude,   
                    address: b.address.number_and_street,
                    city: b.address.city,
                    country: b.address.country,
                    zip_code: b.address.zip_code,
                    name: b.admin_full_name,
                    batteries: b.batteries.count,
                    column: Column.where(battery_id: bat_ids).count,
                    elevator: Elevator.where(column_id: col_ids).count,
                    contact: b.contact_technic_full_name,
                    email: b.contact_technic_email,
                    phone_number: b.contact_technique_phone,
                    temperature: temperature,
                    min: min,
                    max: max,
                    pressure: pressure,
                    humidity: humidity

                        
                }
        end
    end
end
