module Owner
  class BaseController < ApplicationController
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    before_action :verify_institution_owner

    layout :layout_by_resource

    def index
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:password, :password_confirmation, :current_password, :name, roles: [])
      end
    end

    private 
    
      def layout_by_resource
        if devise_controller?
          'layouts/devise'
        else
          'admin/layouts/admin'
        end
      end
      
      def verify_institution_owner
        raise CanCan::AccessDenied unless current_user.is?(:institution_owner)
      end
  end
end
