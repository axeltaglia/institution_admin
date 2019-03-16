module Owner
  class StudentsController < Owner::BaseController
    before_action :set_student, only: [:show, :edit, :update, :destroy, :pay_fee]
    before_action :set_institution, only: [:create]

    # GET /students
    def index
      @students = Student.all
    end

    # GET /students/1
    def show
    end

    # GET /students/new
    def new
      @student = Student.new
      @url = owner_students_path
      @student.contact_informations.build
      @student.subscriptions.build
    end

    # GET /students/1/edit
    def edit
      @url = owner_student_path(@student)
    end

    # POST /students
    def create
      @student = Student.new(student_params)
      @student.institution = @institution
      email = @student.contact_informations.first.email

      respond_to do |format|
        if @student.save
          @student.save
          format.html { redirect_to owner_students_path, notice: t('owner.students.create.success') }
        else
          @url = owner_students_path
          flash[:warning] = @student.errors.full_messages.uniq.join(', ')
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /students/1
    def update
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to owner_students_path, notice: t('owner.students.update.success') }
        else
          @url = owner_students_path
          flash[:warning] = @student.errors.full_messages.uniq.join(', ')
          format.html { render :edit }
        end
      end
    end

    # DELETE /students/1
    def destroy
      @student.subscriptions.destroy_all
      @student.contact_informations.destroy_all
      @student.destroy
      
      respond_to do |format|
        format.html { redirect_to owner_students_url, notice: t('owner.students.destroy.success') }
      end
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

      def student_params
        params.require(:student).permit(
          :name, 
          :last_name, 
          :email, 
          :phone, 
          :description, 
          :status, 
          contact_informations_attributes:[
            :email, 
            :phone, 
            :description, 
            :receives_emails, 
            :_destroy, 
            :id
          ],
          subscriptions_attributes:[
            :asignature_id, 
            :status, 
            :day_id, 
            :start_at_id, 
            :end_at_id, 
            :classroom_id, 
            :_destroy, 
            :id
          ], 
          
        )
      end
  end
end