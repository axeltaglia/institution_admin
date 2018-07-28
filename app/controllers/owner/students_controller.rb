module Owner
  class StudentsController < Owner::BaseController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
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
    end

    # GET /students/1/edit
    def edit
      @url = owner_student_path(@student)
    end

    # POST /students
    def create
      @student = Student.new
      @student = Student.new(student_params)
      @stuent.institution = @institution

      respond_to do |format|
        if @student.save
          user = User.create!(name: student_params[:name], email: student_params[:email], password: "123456")
          user.student!
          user.save
          @student.user = user
          @student.save

          format.html { redirect_to owner_students_path, notice: t('owner.students.create.success') }
        else
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
          format.html { render :edit }
        end
      end
    end

    # DELETE /students/1
    def destroy
      StudentService.destroy_student(@student)
      respond_to do |format|
        format.html { redirect_to owner_students_url, notice: t('owner.students.destroy.success') }
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
        params.require(:student).permit(:name, :last_name, :email, :phone, :description)
      end
  end
end