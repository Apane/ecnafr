require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  test "should get _subscription" do
    get :_subscription
    assert_response :success
  end

end
