class LogisticMeshesController < ApplicationController
  before_action :set_logistic_mesh, only: [:show, :edit, :update, :destroy]

  # GET /logistic_meshes
  # GET /logistic_meshes.json
  def index
    @logistic_meshes = LogisticMesh.all
  end

  # GET /logistic_meshes/1
  # GET /logistic_meshes/1.json
  def show
  end

  # GET /logistic_meshes/new
  def new
    @logistic_mesh = LogisticMesh.new
  end

  # GET /logistic_meshes/1/edit
  def edit
  end

  # POST /logistic_meshes
  # POST /logistic_meshes.json
  def create
    @logistic_mesh = LogisticMesh.new(logistic_mesh_params)

    respond_to do |format|
      if @logistic_mesh.save
        format.html { redirect_to @logistic_mesh, notice: 'Logistic mesh was successfully created.' }
        format.json { render :show, status: :created, location: @logistic_mesh }
      else
        format.html { render :new }
        format.json { render json: @logistic_mesh.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logistic_meshes/1
  # PATCH/PUT /logistic_meshes/1.json
  def update
    respond_to do |format|
      if @logistic_mesh.update(logistic_mesh_params)
        format.html { redirect_to @logistic_mesh, notice: 'Logistic mesh was successfully updated.' }
        format.json { render :show, status: :ok, location: @logistic_mesh }
      else
        format.html { render :edit }
        format.json { render json: @logistic_mesh.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logistic_meshes/1
  # DELETE /logistic_meshes/1.json
  def destroy
    @logistic_mesh.destroy
    respond_to do |format|
      format.html { redirect_to logistic_meshes_url, notice: 'Logistic mesh was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logistic_mesh
      @logistic_mesh = LogisticMesh.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logistic_mesh_params
      params.require(:logistic_mesh).permit(:origin, :destination, :distance)
    end
end
