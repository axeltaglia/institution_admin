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
      
      def pay_fee
        fee = Fee.find(params[:fee_id])
        fee.payed!
        fee.amount_paid = fee.total_to_pay
        fee.save
  
        fee.student.contact_informations.each do |contact|
          StudentMailer.receipt_email(fee, contact.email).deliver_now
        end
  
        StudentMailer.receipt_email(fee, "axeltaglia@gmail.com").deliver_now
        
        respond_to do |format|
          format.html { redirect_to owner_student_path(@student), notice: "The payment was successful." }
        end
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