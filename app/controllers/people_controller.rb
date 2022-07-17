class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.page(params[:page])
  end

  def new
    @person = Person.new
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

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :phone, :email, :web, :twitter, :user_id, :about, :ava)
  end

end
