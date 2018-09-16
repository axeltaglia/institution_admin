module Owner
  class CoursesController < Owner::BaseController
    before_action :set_course, only: [:show, :edit, :update, :destroy]
    before_action :set_institution, only: [:create]

    # GET /courses
    def index
      #@courses = Course.all.joins(:schedule).(:order => 'schedule.day.number, schedule.hour.seconds_since_midnight')
      @courses = Course.all
    end

    # GET /courses/1
    def show
    end

    # GET /courses/new
    def new
      @course = Course.new
      @course.course_schedules.build
      @url = owner_courses_path
    end

    # GET /courses/1/edit
    def edit
      @url = owner_course_path(@course)
    end

    # POST /courses
    def create
      @course = Course.new(course_params)
      @course.institution = @institution

      respond_to do |format|
        if @course.save
          format.html { redirect_to owner_courses_path, notice: t('owner.courses.create.success') }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /courses/1
    def update
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to owner_courses_path, notice: t('owner.courses.update.success') }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /courses/1
    def destroy
      @course.course_schedules.destroy_all
      @course.destroy
      respond_to do |format|
        format.html { redirect_to owner_courses_url, notice: t('owner.courses.destroy.success') }
      end
    end

    private
      def set_course
        @course = Course.find(params[:id])
      end

      def set_institution
        @institution = current_user.institution_owner.institution
      end

      def course_params
        params.require(:course).permit(:asignature_id, :capacity, :price, :charging_mode, course_schedules_attributes:[:description, :day_id, :start_at_id, :end_at_id, :classroom_id, :_destroy, :id])
      end
  end
end