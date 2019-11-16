require 'test_helper'

class SpeakControllerTest < ActionDispatch::IntegrationTest
  test "should get watson" do
    get speak_watson_url
    assert_response :success
  end

end
