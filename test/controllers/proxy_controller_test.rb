require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
      get proxy_input_url
      assert_response :success
    end
  test "should get output" do
      get proxy_output_url
      assert_response :success
    end
  test 'test url xslt' do
      get '/output?side=client-with-xslt'
      assert body.include?('/browser_transform.xslt')
    end
end
