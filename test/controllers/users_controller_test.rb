require "test_helper"

describe UsersController do
  it "must get longin_form" do
    get users_login_form_url
    must_respond_with :success
  end

  it "must get login" do
    get users_login_form_url
    must_respond_with :success
  end

  it "must get logout" do
    get users_loggout_url
    must_respond_with :success
  end

  it "must get current" do
    get users_current_url
    must_respond_with :success
  end

end
