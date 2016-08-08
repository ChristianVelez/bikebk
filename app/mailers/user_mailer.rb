class UserMailer < ApplicationMailer
  default from: "support@bikeblackrock.com"

  def contact_form(email, name, message)
  @message = message
  attachments.inline['bike_logo4.svg'] = File.read("#{Rails.root}/app/assets/images/bike_logo4.svg")
  attachments.inline['facebook.svg'] = File.read("#{Rails.root}/app/assets/images/facebook.svg")
  attachments.inline['twitter.svg'] = File.read("#{Rails.root}/app/assets/images/twitter.svg")
    mail(:from => email,
         :to => 'christian.velez1@gmail.com',
         :subject => "A new contact form message from #{name}")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def welcome(user)
  @appname = "bike BK"
  attachments.inline['bike_logo4.svg'] = File.read("#{Rails.root}/app/assets/images/bike_logo4.svg")
  attachments.inline['facebook.svg'] = File.read("#{Rails.root}/app/assets/images/facebook.svg")
  attachments.inline['twitter.svg'] = File.read("#{Rails.root}/app/assets/images/twitter.svg")
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
  end
end
