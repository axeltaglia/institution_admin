module Admin
  class InstitutionsController < Admin::BaseController
    before_action :set_institution, only: [:show, :edit, :update, :destroy]

    # GET /institutions
    def index
      @institutions = Institution.all
    end

    # GET /institutions/1
    def show
    end

    # GET /institutions/new
    def new
      @institution = Institution.new
      @url = admin_institutions_path
    end

    # GET /institutions/1/edit
    def edit
      @url = admin_institution_path(@institution)
    end

    # POST /institutions
    def create
      @institution = Institution.new(institution_params)

      respond_to do |format|
        if @institution.save
          format.html { redirect_to admin_institutions_path, notice: 'Institution was successfully created.' }
        else
          @url = admin_institutions_path
          flash[:warning] = @institution.errors.full_messages.uniq.join(', ')
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /institutions/1
    def update
      respond_to do |format|
        if @institution.update(institution_params)
          format.html { redirect_to admin_institutions_path, notice: 'Institution was successfully updated.' }
        else
          @url = admin_institution_path(@institution)
          flash[:warning] = @institution.errors.full_messages.uniq.join(', ')
          format.html { render :edit }
        end
      end
    end

    # DELETE /institutions/1
    def destroy
      @institution.destroy
      respond_to do |format|
        format.html { redirect_to admin_institutions_url, notice: 'Institution was successfully destroyed.' }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_institution
        @institution = Institution.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def institution_params
        params.require(:institution).permit(:name, :institution_owner_id)
      end
  end
end