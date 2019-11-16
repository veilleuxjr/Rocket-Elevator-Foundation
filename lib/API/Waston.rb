# require "json"
# require "ibm_watson/authenticators"
# require "ibm_watson/text_to_speech_v1"

# authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
#     apikey: ENV['Text_to_speech']
#   )

#   text_to_speech = IBMWatson::TextToSpeechV1.new(
#     authenticator: authenticator
#   )
#   text_to_speech.service_url = ENV['Text_to_speech_url']
  
#   File::open("public/output.wav", "w+") do |audio_file|
#     response = text_to_speech.synthesize(
#       text: "king misa",
#       accept: "audio/wav",
#       voice: "en-US_AllisonVoice"
#     ).result
#     audio_file << response
#   end
