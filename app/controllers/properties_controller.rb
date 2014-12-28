class PropertiesController < ApplicationController
  before_filter :authenticate_user!

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
    authorize @properties
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @contact = Contact.find(params[:contact_id])
    @property = Property.find(params[:id])
    authorize @property
  end

  # GET /properties/new
  def new
    @contact = Contact.find(params[:contact_id])
    @property = Property.new
    authorize @property
  end

  # GET /properties/1/edit
  def edit
    @contact = Contact.find(params[:contact_id])
    @property = Property.find(params[:id])
    authorize @property
  end

  # POST /properties
  # POST /properties.json
  def create
    @contact = Contact.find(params[:contact_id])
    @property = Property.new(property_params)
    @property.contact = @contact
    authorize @property

    respond_to do |format|
      if @property.save
        format.html { redirect_to edit_contact_path(@contact), notice: 'Property was successfully created.' }
        format.json { redirect_to edit_contact_path(@contact), status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    @contact = Contact.find(params[:contact_id])
    @property = Property.find(params[:id])
    authorize @property

    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to edit_contact_path(@contact), notice: 'Property was successfully updated.' }
        format.json { redirect_to edit_contact_path(@contact), status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @contact = Contact.find(params[:contact_id])
    @property = Property.find(params[:id])
    authorize @property
    @property.destroy
    respond_to do |format|
      format.html { redirect_to edit_contact_path(@contact), notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def property_params
      params.require(:property).permit(:street_no, :street, :city, :state, :zip, :year_built, :units, :purchase_year, :contact_id)
    end
end
