module Admin
  class InstitutionsController < Admin::BaseController
    before_action :set_institution, only: [:show, :edit, :update, :destroy]

    # GET /institutions
    # GET /institutions.json
    def index
      @institutions = Institution.all
    end

    # GET /institutions/1
    # GET /institutions/1.json
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
    # POST /institutions.json
    def create
      @institution = Institution.new(institution_params)

      respond_to do |format|
        if @institution.save
          format.html { redirect_to admin_institution_path(@institution), notice: 'Institution was successfully created.' }
          format.json { render :show, status: :created, location: admin_institution_path(@institution) }
        else
          format.html { render :new }
          format.json { render json: @institution.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /institutions/1
    # PATCH/PUT /institutions/1.json
    def update
      respond_to do |format|
        if @institution.update(institution_params)
          format.html { redirect_to admin_institution_path(@institution), notice: 'Institution was successfully updated.' }
          format.json { render :show, status: :ok, location: admin_institution_path(@institution) }
        else
          format.html { render :edit }
          format.json { render json: @institution.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /institutions/1
    # DELETE /institutions/1.json
    def destroy
      @institution.destroy
      respond_to do |format|
        format.html { redirect_to admin_institutions_url, notice: 'Institution was successfully destroyed.' }
        format.json { head :no_content }
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