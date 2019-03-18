module ApplicationHelper
	def dashboard_url
		return new_user_session_url unless current_user
		return owner_subscriptions_path if current_user.is? :admin
		return owner_subscriptions_path if current_user.is? :institution_owner
		return new_user_session_url
	end
end
