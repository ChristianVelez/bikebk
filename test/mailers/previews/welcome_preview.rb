class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome("Chris")
  end
end