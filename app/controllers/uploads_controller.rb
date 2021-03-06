class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?
  end

  # POST /uploads
  # POST /uploads.json
  def create
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    @upload = Upload.create(upload_params)
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?

    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    redirect_to root_path, notice: "Area protegida. Requiere login!" if current_user.nil?
    
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:uploaded_file)
      #params[:upload].permit(:uploaded_file)
    end
end