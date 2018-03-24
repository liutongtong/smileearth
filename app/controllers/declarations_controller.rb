class DeclarationsController < ApplicationController
  before_action :set_declaration, only: [:show, :edit, :update, :destroy]

  # GET /declarations
  # GET /declarations.json
  def index
    @declarations = Declaration.all
  end

  # GET /declarations/1
  # GET /declarations/1.json
  def show
  end

  # GET /declarations/new
  def new
    @declaration = Declaration.new
  end

  # GET /declarations/1/edit
  def edit
  end

  # POST /declarations
  # POST /declarations.json
  def create
    @declaration = Declaration.new(declaration_params)

    respond_to do |format|
      if @declaration.save
        format.html { redirect_to @declaration, notice: 'Declaration was successfully created.' }
        format.json { render :show, status: :created, location: @declaration }
      else
        format.html { render :new }
        format.json { render json: @declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /declarations/1
  # PATCH/PUT /declarations/1.json
  def update
    respond_to do |format|
      if @declaration.update(declaration_params)
        format.html { redirect_to @declaration, notice: 'Declaration was successfully updated.' }
        format.json { render :show, status: :ok, location: @declaration }
      else
        format.html { render :edit }
        format.json { render json: @declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /declarations/1
  # DELETE /declarations/1.json
  def destroy
    @declaration.destroy
    respond_to do |format|
      format.html { redirect_to declarations_url, notice: 'Declaration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_declaration
      @declaration = Declaration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def declaration_params
      params.require(:declaration).permit(:ip_address, :city, :country_name, :country_code, :latitude, :longitude, :time_zone, :image, :rawemotiondata, :email)
    end
end
