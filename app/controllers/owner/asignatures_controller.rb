module Owner
  class AsignaturesController < Owner::BaseController
    before_action :set_asignature, only: [:show, :edit, :update, :destroy]
    before_action :set_institution, only: [:create]

    # GET /asignatures
    def index
      @asignatures = Asignature.all
    end

    # GET /asignatures/1
    def show
    end

    # GET /asignatures/new
    def new
      @asignature = Asignature.new
      @url = owner_asignatures_path
    end

    # GET /asignatures/1/edit
    def edit
      @url = owner_asignature_path(@asignature)
    end

    # POST /asignatures
    def create
      @asignature = Asignature.new(asignature_params)
      @asignature.institution = @institution

      respond_to do |format|
        if @asignature.save
          format.html { redirect_to owner_asignatures_path, notice: t('owner.asignatures.create.success') }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /asignatures/1
    def update
      respond_to do |format|
        if @asignature.update(asignature_params)
          format.html { redirect_to owner_asignatures_path, notice: t('owner.asignatures.update.success') }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /asignatures/1
    def destroy
      @asignature.destroy
      respond_to do |format|
        format.html { redirect_to owner_asignatures_url, notice: t('owner.asignatures.destroy.success') }
      end
    end

    private
      def set_asignature
        @asignature = Asignature.find(params[:id])
      end

      def set_institution
        @institution = current_user.institution_owner.institution
      end

      def asignature_params
        params.require(:asignature).permit(:name)
      end
  end
end