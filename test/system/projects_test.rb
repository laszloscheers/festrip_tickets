require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
    setup do
      @product = products(:one)
    end
  
    test "visiting the index" do
      visit root_url
      assert_selector "h1", text: "START YOUR JOURNEY TO ALL KINDS OF WONDERS"
    end

    test "should create user" do
      visit sign_up_url

      fill_in "user_email", with: "test@emaple.com"
      fill_in "user_password", with: 123456
      fill_in "user_password_confirmation", with: 123456

      assert_text "Welcome! You have signed up successfully."
    end

    test "should sign in" do
      visit sign_in_url

      fill_in "user_email", with: "test@emaple.com"
      fill_in "user_password", with: 123456

      assert_text "Signed in successfully."
    end

    test "visiting the profile" do
      sign_in users(:regular)
      visit profile_url
      assert_selector "h2", text: "Email"
    end
  
    test "can purchase" do
      sign_in users(:regular)
      visit festivals_url
      click_on "Add to Basket"
  
      assert_selector "div", text: "Tomorrow Land"
      click_on "Purchase"
      assert_selector "div", text: "Tomorrow Land"
    end
  
    test "should update user" do
      sign_in users(:regular)
      visit profiles_url
      click_on "Edit Profile"
  
      fill_in "user_email", with: 1234567
      fill_in "user_password", with: 1234567
      fill_in "user_password_confirmation", with: 123456

      assert_text "Your account has been updated successfully."
    end
  
    test "should destroy a user" do
      sign_in users(:regular)
      visit profiles_url
      click_on "Cancel my account"
      assert_text "Bye! Your account has been successfully cancelled. We hope to see you again soon."
    end
    
  end
  