class CompaniesController < ApplicationController
  before_action :set_company, only: [:show]
  load_and_authorize_resource

  def index
    @companies = Company.all.order(name: :asc)
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_url, notice: 'Empresa fue creada exitosamente.'
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to companies_url, notice: 'Empresa fue actualizada exitosamente.'
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company)
          .permit(:name, :logo, :ceo, :industry, :address, :region, :province,
                  :commune, :country, :identity_number, :url, :contact_email, :phone)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
