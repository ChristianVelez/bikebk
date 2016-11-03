class UserMailerPreview < ActionMailer::Preview
  def payment_confirmation
    UserMailer.payment_confirmation(Order.first)
  end
end