class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.page(params[:page])
  end

  def new
    @company = Company.new
    @after_cancel = after_edit_companies_path
  end

  def create
    @company = Company.new(company_params)
    
    if @company.save
      respond_to do |format|
        format.html { redirect_to companies_path, notice: 'Company was successfully created' }
        format.turbo_stream { flash.now[:notice] = 'Company was successfully created' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_path, notice: 'Company was successfully destroyed' }
      format.turbo_stream { flash.now[:notice] = 'Company was successfully destroyed' }
    end
  end

  def update
    if @company.update(company_params)
      respond_to do |format|
        format.html { redirect_to companies_path, notice: 'Company was successfully updated' }
        format.turbo_stream { flash.now[:now] = 'Company was successfully updated' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @after_cancel = companies_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :phone, :web, :address, :user_id, :about, :ava)
  end
end
