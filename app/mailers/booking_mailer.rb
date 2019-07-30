require 'json'
class BookingMailer < ApplicationMailer
  default from: "suitojapan328@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_confirmation.subject
  #
  def booking_confirmation(obj)
    @obj = obj
    byebug
    if !@obj[:email].nil?  
      mail to: @obj[:email], subject: "Booking Confirmation"
    end 

    # if @obj['representative_email'].present? 
    #   mail to: @obj['representative_email'], subject: "Booking Confirmation"
    # end 
  end
end
