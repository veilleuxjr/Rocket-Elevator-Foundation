
require "ibm_watson"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"

class SpeakController < ApplicationController

def watson

  authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
      apikey: ENV['Text_to_speech']
    )

    text_to_speech = IBMWatson::TextToSpeechV1.new(
      authenticator: authenticator
    )
    text_to_speech.service_url = "https://stream.watsonplatform.net/text-to-speech/api"
    
    File::open("public/output.wav", "wb") do |audio_file|
      response = text_to_speech.synthesize(
        text: "Greeting#{current_user.employee.first_name}.
                  There are currently #{Elevator.count} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers. 
                  Currently, #{Elevator.where(status: 'Inactive').count} elevators are not in Running Status and are being serviced. 
                  You currently have #{Quote.count} quotes awaiting processing. 
                  You currently have #{Lead.count} leads in your contact requests. 
                  #{Battery.count} Batteries are deployed across #{Building.joins(:address).select('addresses.city').distinct.count} cities",
        accept: "audio/wav",
        voice: "en-US_AllisonVoice"
      ).result
      audio_file << response
  
    end
  end
 
  def star_wars

    if "#{Rails.root}/public/output_starWars.wav" != nil
      puts "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
      system("rm public/output_starWars.wav")
    end
    random_id = *(1..30)
    a = random_id.sample
    url =  "https://swapi.co/api/people/#{a}/"

    puts "******************************"
    puts url

    resp = Faraday.get(url)
    puts resp
    response = JSON.parse(resp.body)
    puts response
    
    phrase = "Welcome to Starwars Facts! Did you know that  #{response["name"]} is #{response["height"]} centimeters tall, he weights #{response["mass"]} kilograms, his hair color is #{response["hair_color"]}, his skin color is #{response["skin_color"]}, his eye color is #{response["eye_color"]}, his birthday is #{response["birth_year"]}, and his gender is #{response["gender"]}, if you want an other fact just refresh the page!"
    puts phrase

    puts "==============================="
    
    # people = random_id{name:"", height:"", mass:"", hair_color:"", skin_color:"", eye_color:"", birth_year:"", gender:"", },
    
    authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
      apikey: ENV['Text_to_speech']
    )
  
    text_to_speech = IBMWatson::TextToSpeechV1.new(
      authenticator: authenticator
    )
    text_to_speech.service_url = "https://stream.watsonplatform.net/text-to-speech/api"

    File::open("public/output_starWars.wav", "wb") do |audio_file|
      response = text_to_speech.synthesize(
        text: phrase,             
        accept: "audio/wav",
        voice: "en-US_AllisonVoice"
      ).result
      audio_file << response
    end
  end
end