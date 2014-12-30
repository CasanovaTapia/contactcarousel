class CallsController < ApplicationController

  def index
    @contact = Contact.find(params[:contact_id])
    @calls = @contact.calls
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @call = Call.new
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @call = Call.new
  end

  def edit
    @contact = Contact.find(params[:contact_id])
    @call = Call.find(params[:id])
    redirect_to edit_contact_path(@contact)
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @call = Call.new(call_params)
    @call.contact_id = @contact.id
    @call.user_id = current_user.id

    if @call.save
      flash[:notice] = "Your Call was successfully posted."
      redirect_to edit_contact_path(@contact)
    else
      flash[:error] = "Your Call was not posted. Please try again."
      redirect_to edit_contact_path(@contact)
    end
  end

  def update
    @contact = Contact.find(params[:contact_id])
    @call = Call.find(params[:id])
    redirect_to edit_contact_path(@contact)
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @call = Call.find(params[:id])
    @call.destroy
    redirect_to edit_contact_path(@contact)
  end

  private
    def call_params
      params.require(:call).permit(:contact_id, :user_id, :dial_id, :conversation_id, :investing_id, :timing_id, :motivator_id)
    end
end
