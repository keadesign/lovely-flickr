require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def "new renders login form"
    get :new
    assert_response :ok
  end

  test "create with invalid params renders errors" do
    post :create, email: "foo", password: "bar"
    assert_action :new
    assert flash[:error]
  end

  test "create with valid email and password sets session id" do
    post :create, user: {email: user.email, password_digest: user.digest}
    assert_equal session[:user_id], user.id
  end

  test "destroy clears the session" do
    get :destroy
    assert_nil session[:user_id]
  end




  # test "the truth" do
  #   assert true
  # end
end
