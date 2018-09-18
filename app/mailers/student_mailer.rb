class StudentMailer < ApplicationMailer
  def receipt_email(fee)
  	@fee = fee
  	@str_month = number_to_month(fee.month)
  	Rails.logger.debug("AXEL: enviando mail, month --> #{fee.month}")
    mail(to: "axeltaglia@gmail.com", subject: "BeBop Escuela de Música - Recibo de pago (#{@str_month})")
  end

  def number_to_month (n)
  	"Enero" if n == 1
  	"Febrero" if n == 2
  	"Marzo" if n == 3
  	"Abril" if n == 4
  	"Mayo" if n == 5
  	"Junio" if n == 6
  	"Julio" if n == 7
  	"Agosto" if n == 8
  	"Septiembre" if n == 9
  	"Octubre" if n == 10
  	"Noviembre" if n == 11
  	"Diciembre" if n == 12
  end
end
