require 'rails_helper'

RSpec.describe "admin login page", type: :request do
  describe "GET /admin" do
    it "it displays the admin login page" do
      get admin_path
      expect(response).to have_http_status(200)
    end
  end
end

# RSpec.describe "home page", type: :request do
#   it "displays the user's username after successful login" do
#     user = User.create!(first_name: "test", last_name: "user", username: "test_user", password: "password123", password_confirmation: "password123", role: "admin")
#     get admin_path
#     assert_select "form" do
#       assert_select "input[name=?]", "session[username]"
#       assert_select "input[name=?]", "session[password]"
#       assert_select "input[type=?]", "submit"
#     end

#     post admin_path, :params => {:session => {username: "test_user", password: "password123"}}
#     expect(response).to have_http_status(:created)
#   end
# end
