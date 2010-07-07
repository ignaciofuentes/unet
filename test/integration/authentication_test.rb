require 'test_helper'

class AuthenticationTest < ActionController::IntegrationTest
  fixtures :all

  # Replace this with your real tests.
  test "log in con nombre y clave correcto" do
    User.create!(:login => "nacho", :password => "12345", :password_confirmation => "12345", :email => "nacho@gmail.com", :active => true)
	visit login_url
	fill_in "user_session[login]", :with => "nacho"
	fill_in "user_session[password]", :with => "12345"
	click_button "user_session_submit"
	assert_contain 'Logout'	
  end
  
  test "log in con nombre y clave incorrecto" do
    User.create!(:login => "nacho", :password => "12345", :password_confirmation => "12345", :email => "nacho@gmail.com", :active => true)
	visit login_url
	fill_in "user_session[login]", :with => "nacho"
	fill_in "user_session[password]", :with => "123456"
	click_button "user_session_submit"
	assert_contain 'error prohibited'	
  end  
end