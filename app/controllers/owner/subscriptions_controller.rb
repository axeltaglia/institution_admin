module Owner
    class SubscriptionsController < Owner::BaseController
      before_action :set_student, only: [:show, :edit, :update, :destroy, :pay_fee]
      before_action :set_institution, only: [:index, :create]
  
      # GET /subscriptions
      def index
        @subscriptions = 
            Subscription
              .where(status: 1)
              .includes(:day)
              .includes(:start_at)
              .order('days.number', 'hours.seconds_since_midnight')

      end
      
      private
        def set_student
          @student = Student.find(params[:id])
        end
  
        def set_institution
          @institution = current_user.institution_owner.institution
        end
  
    end
  end