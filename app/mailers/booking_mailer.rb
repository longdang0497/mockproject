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
    if @obj[:send_mail_only_representative].present?
      if @obj[:send_mail_only_representative] == "true" || @obj[:send_mail_only_representative] == true
        if !@obj[:representative_email].nil? 
          mail to: @obj[:representative_email], subject: "Booking Confirmation"
        end
      elsif @obj[:send_mail_only_representative] == "false" || @obj[:send_mail_only_representative] == "" || @obj[:send_mail_only_representative].nil? || @obj[:send_mail_only_representative] == false
        if !@obj[:email].nil?  
          if !@obj[:representative_email].nil? 
          mail to: @obj[:email],
              bcc: @obj[:representative_email],
              subject: "Booking Confirmation"
          else
            mail to: @obj[:email], subject: "Booking Confirmation"
          end 
        end         
      end
    else
      if !@obj[:email].nil?  
        mail to: @obj[:email], subject: "Booking Confirmation"
      end
    end
  end
end
