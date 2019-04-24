module ApplicationHelper
	def dashboard_url
		return new_user_session_url unless current_user
		return owner_subscriptions_path if current_user.is? :admin
		return owner_subscriptions_path if current_user.is? :institution_owner
		return new_user_session_url
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
