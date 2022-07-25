class PeopleController < ApplicationController
  protect_from_forgery except: [:by_company]
  include Responsible
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.page(params[:page])
  end

  def new
    @person = Person.new
    @framed = true
    @after_cancel = after_edit_people_path
  end

  def create
    @person = Person.new(person_params)
    
    if @person.save
      respond_with_item(people_path, 'Person')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy
    
    respond_with_item(people_path, 'Person')
  end

  def update
    if @person.update(person_params)
      respond_for_update(people_path, person_path(@person), 'Person')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @framed = respond_for_cancel
    path_to = @framed ? people_path : person_path(@person)
    @after_cancel = path_to
  end

  def by_company
    company_id = params[:company_id]

    result_list = CompanyPerson.joins(:person).where( company_id: company_id ).pluck(:person_id, :name).map { |rec| {id: rec[0], name: rec[1]} }

    respond_to do |format|
      format.js { render json: result_list }
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :phone, :email, :web, :twitter, :user_id, :about, :ava, company_people_attributes: [:id, :company_id, :role, :_destroy])
  end

end
