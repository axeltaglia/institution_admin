class StudentMailer < ApplicationMailer
  def receipt_email(fee)
  	@fee = fee
  	@str_month = number_to_month(fee.month)

  	fee.student.contact_informations.each do |contact|
  		mail(to: contact.email, subject: "BeBop Escuela de Música - Recibo de pago (#{@str_month})")
  	end

  	mail(to: "axeltaglia@gmail.com", subject: "BeBop Escuela de Música - Recibo de pago (#{@str_month})")
    
  end

  def number_to_month (n)
  	month = "Enero" if n == 1
  	month = "Febrero" if n == 2
  	month = "Marzo" if n == 3
  	month = "Abril" if n == 4
  	month = "Mayo" if n == 5
  	month = "Junio" if n == 6
  	month = "Julio" if n == 7
  	month = "Agosto" if n == 8
  	month = "Septiembre" if n == 9
  	month = "Octubre" if n == 10
  	month = "Noviembre" if n == 11
  	month = "Diciembre" if n == 12

  	month
  end
end
