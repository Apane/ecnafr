require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  test "quotes" do
    mail = SubscriptionMailer.quotes
    assert_equal "Quotes", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
