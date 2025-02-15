require "test_helper"

class ChefsSignupTest < ActionDispatch::IntegrationTest
  
  test "should get signup path" do
    get signup_path
    assert_response :success
  end

  test "reject on invalid signup" do
    get signup_path
    assert_no_difference "Chef.count" do
      post chefs_path, params: { chef: {chefname: " ", email: " ", password: "password",
        password_confirmation: " "} }
    end
    assert_redirected_to signup_path(chef: assigns(:chef), errors: assigns(:errors), count: assigns(:count), error: assigns(:error))
    follow_redirect!
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "accept valid signup" do
    get signup_path
    assert_difference "Chef.count", 1 do
      post chefs_path, params: { chef: {chefname: "mashrur", email: "mashrur@example.com", password: "password",
        password_confirmation: "password"} }
    end
    follow_redirect!
    assert_template 'chefs/show'
    assert_not flash.empty?
  end

end
