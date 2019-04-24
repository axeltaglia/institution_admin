module Owner
    class FeesController < Owner::BaseController
      before_action :set_fee, only: [:show, :edit, :update, :destroy, :pay_fee]
      before_action :set_institution, only: [:index, :create]
  
      # GET /fees/1
      def show
      end
  
      # GET /fees/1/edit
      def edit
        @url = owner_fee_path(@fee)
      end
  
      # PATCH/PUT /fees/1
      def update
        respond_to do |format|
          if @fee.update(fee_params)
            format.html { redirect_to owner_subscriptions_path, notice: t('owner.fees.update.success') }
          else
            @url = owner_fees_path
            flash[:warning] = @fee.errors.full_messages.uniq.join(', ')
            format.html { render :edit }
          end
        end
      end
  
      # DELETE /fees/1
      def destroy
        @fee.destroy
        
        respond_to do |format|
          format.html { redirect_to owner_fees_url, notice: t('owner.fees.destroy.success') }
        end
      end

      def generate_fees
        month = params[:month]
        year = params[:year]

        generated_count = 0
        Student.actives.each do |student|
          if student.fees.where(month: month).empty?
            
            fee = student.fees.create!(
              year: year,
              month: month,
              amount_paid: 0,
              status: 0
            )

            total_to_pay = 0
            subscriptions = 
              student.subscriptions
                .where(status: 1)

            subscriptions.each do |subscription|
              total_to_pay += subscription.price
              fee.items.create!(
                asignature_name: subscription.asignature.name,
                subscription_price: subscription.price,
                day: subscription.day.name,
                start_at: subscription.start_at.str_time,
                end_at: subscription.end_at.str_time,
                classroom: subscription.classroom.name
              )
              generated_count += 1
            end

            fee.total_to_pay = total_to_pay
            fee.save
          end
        end

        respond_to do |format|
          format.html { redirect_to owner_dashboard_url, notice: "Se han generado #{generated_count} coutas satisfactoriamente." }
        end

      end
  
      def pay_fee
        fee = Fee.find(params[:fee_id])
    
        fee.student.contact_informations.each do |contact|
          #StudentMailer.receipt_email(fee, contact.email).deliver_now
        end
  
        fee.payed!
        fee.amount_paid = fee.total_to_pay
        fee.save
  
        #StudentMailer.receipt_email(fee, "axeltaglia@gmail.com").deliver_now
        
        
        respond_to do |format|
          format.html { redirect_to owner_student_path(fee.student), notice: "El recibo fue generado y enviado exitosamente." }
        end
      end
  
      private
        def set_fee
          @fee = Fee.find(params[:id])
        end
  
        def set_institution
          @institution = current_user.institution_owner.institution
        end
  
        def fee_params
          params.require(:fee).permit(
            :total_to_pay, 
            :amount_paid, 
            :status
          )
        end
    end
  end