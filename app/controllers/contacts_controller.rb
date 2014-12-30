class ContactsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_current_user

  def database
  end

  def import
    Contact.import(params[:file])
    redirect_to contacts_path, notice: "Contacts imported."
  end

  def index
    if params[:query].present?
      @contacts = current_user.contacts.paginate(page: params[:page], per_page: 50).search(params[:query])
    else
      @contacts = current_user.contacts.all.paginate(page: params[:page], per_page: 50)
    end
    authorize @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    @new_call = @contact.calls.build
    redirect_to edit_contact_path(@contact)
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def edit
    @contact = Contact.find(params[:id])
    @user = @contact.user
    @new_call = @contact.calls.build
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id

    authorize @contact
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :edit, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @contact = Contact.find(params[:id])
    authorize @contact
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { render :edit, notice: 'Contact was successfully updated.' }
        format.json { render :edit }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    authorize @contact
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :entity, :phone, :alt_phone, :dead_phone, :email, :alt_email, :dead_email, :dial_id, :conversation_id, :investing_id, :timing_id, :motivator_id, :body, :user_id)
    end
end
