require "test_helper"

class ChefsEditTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com",
      password: "password", password_confirmation: "password")
  end

  test "reject on invalid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {chefname: " ", email: "mashrur@example.com" } }
    assert_redirected_to edit_chef_path(chef: assigns(:chef), errors: assigns(:errors), count: assigns(:count), error: assigns(:error))
    follow_redirect!
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "accept valid signup" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_response :success
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {chefname: "mashrur1", email: "mashrur1@example.com" } }
    assert_redirected_to @chef
    follow_redirect!
    assert_not flash.empty?
    @chef.reload
    assert_match "mashrur1", @chef.chefname
    assert_match "mashrur1@example.com", @chef.email
  end

end