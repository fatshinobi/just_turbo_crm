class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.page(params[:page])
  end

  def new
    @person = Person.new
    @after_cancel = after_edit_people_path
  end

  def create
    @person = Person.new(person_params)
    
    if @person.save
      respond_to do |format|
        format.html { redirect_to people_path, notice: 'Person was successfully created' }
        format.turbo_stream { flash.now[:notice] = 'Person was successfully created' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to persons_path, notice: 'Person was successfully destroyed' }
      format.turbo_stream { flash.now[:notice] = 'Person was successfully destroyed' }
    end
  end

  def update
    if @person.update(person_params)
      respond_to do |format|
        format.html { redirect_to people_path, notice: 'Person was successfully updated' }
        format.turbo_stream { flash.now[:now] = 'Person was successfully updated' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @after_cancel = people_path
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :phone, :email, :web, :twitter, :user_id, :about, :ava, company_people_attributes: [:id, :company_id, :role, :_destroy])
  end

end
