class ContactsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def database
  end

  def import
    Contact.import(params[:file])
    redirect_to contacts_path, notice: "Contacts imported."
  end

  # GET /contacts
  # GET /contacts.json
  def index
    if params[:query].present?
      @contacts = Contact.search(params[:query])
    else
      @contacts = Contact.all
    end
    authorize @contacts
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    authorize @contact
    redirect_to edit_contact_path(@contact)
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    authorize @contact
  end

  # GET /contacts/1/edit
  def edit
    authorize @contact
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

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

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
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

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    authorize @contact
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :entity, :phone, :alt_phone, :dead_phone, :email, :alt_email, :dead_email, :dial_id, :conversation_id, :investing_id, :timing_id, :motivator_id, :body)
    end
end
