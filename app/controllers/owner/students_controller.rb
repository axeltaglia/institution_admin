module Owner
  class StudentsController < Owner::BaseController
    before_action :set_student, only: [:show, :edit, :update, :destroy]

    # GET /students
    # GET /students.json
    def index
      @students = Student.all
    end

    # GET /students/1
    # GET /students/1.json
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
    # POST /students.json
    def create
      @student = Student.new
      @student = Student.new(student_params)
      
      respond_to do |format|
        if @student.save
          user = User.create!(name: student_params[:name], email: student_params[:email], password: "123456")
          user.student!
          user.save
          @student.user = user
          @student.save

          format.html { redirect_to owner_students_path, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: owner_student_path(@student) }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /students/1
    # PATCH/PUT /students/1.json
    def update
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to owner_students_path, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: owner_student_path(@student) }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /students/1
    # DELETE /students/1.json
    def destroy
      user = @student.user
      @student.destroy
      user.destroy
      
      respond_to do |format|
        format.html { redirect_to owner_students_url, notice: 'Student was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_student
        @student = Student.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def student_params
        params.require(:student).permit(:name, :last_name, :email, :phone, :description)
      end
  end
end