class AdvertisingMailer < ApplicationMailer
    def promotion_email(email_to)
        mail(to: email_to, subject: "¿Querés aprender a tocar algún instrumento? - BeBop Escuela de Música")
    end  
  end
  