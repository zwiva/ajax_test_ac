class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.order(created_at: :desc)
    @company = Company.new
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @claims = Claim.all.order('created_at DESC')
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    respond_to do |format|
      format.js {}
      end
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.create(company_params) #para guardar las nuevas empresas
    respond_to do |format| 
    format.js  
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
    @company.name = params[:company][:name]
    @company.save
    respond_to do |format| 
      format.js  
      end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
    format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name)
    end
end
