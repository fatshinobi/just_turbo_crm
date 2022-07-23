class OpportunitiesController < ApplicationController
  include Responsible
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    @opportunities = Opportunity.page(params[:page])
  end

  def new
    @opportunity = Opportunity.new
    @opportunity.start = Date.today
    @opportunity.user = current_user

    @framed = true

    @after_cancel = after_edit_opportunities_path
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    if @opportunity.save
      respond_with_item(opportunities_path, 'Opportunity')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @opportunity.destroy
    
    respond_with_item(opportunities_path, 'Opportunity')
  end

  def update
    if @opportunity.update(opportunity_params)
      respond_for_update(opportunities_path, opportunity_path(@opportunity), 'Opportunity')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @framed = respond_for_cancel
    path_to = @framed ? opportunities_path : opportunity_path(@opportunity)
    @after_cancel = path_to
  end

  private

  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  def opportunity_params
    params.require(:opportunity).permit(:title, :start, :finish, :description, :stage, :status, :company_id, :person_id, :amount, :user_id, :stage, :status)
  end
end

