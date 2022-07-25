class CompaniesController < ApplicationController
  include Responsible
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.page(params[:page])
  end

  def new
    @company = Company.new
    @framed = true
    @after_cancel = after_edit_companies_path
  end

  def create
    @company = Company.new(company_params)
    
    if @company.save
      respond_with_item(companies_path, 'Company')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy

    respond_with_item(companies_path, 'Company')
  end

  def update
    if @company.update(company_params)
      respond_for_update(companies_path, company_path(@company), 'Company')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @framed = respond_for_cancel
    path_to = @framed ? companies_path : company_path(@company)
    @after_cancel = path_to
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :phone, :web, :address, :user_id, :about, :ava, company_people_attributes: [:id, :person_id, :role, :_destroy])
  end
end
