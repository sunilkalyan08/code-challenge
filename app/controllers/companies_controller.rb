class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      flash[:alert] = @company.errors.full_messages.to_sentence
      render :new
    end
  rescue => e
    flash[:alert] = "Company creation failed with error - #{e}"
    render :new
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Changes Saved"
    else
      flash[:alert] = @company.errors.full_messages.to_sentence
      render :edit
    end
  rescue => e
    flash[:alert] = "Company creation failed with error - #{e}"
    render :new
  end

  def destroy
    company_name = @company.name
    if @company.destroy
      redirect_to companies_path, notice: "The company #{company_name} has been deleted successfully"
    else
      redirect_to companies_path, notice: "Deleting company is failed due to technical error"
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :legal_name,
      :description,
      :zip_code,
      :phone,
      :email,
      :owner_id,
      :city,
      :state,
      :color,
      services: []
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end
  
end
