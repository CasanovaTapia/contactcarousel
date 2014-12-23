class CallsController < ApplicationController

  def index
    @contact = Contact.find(params[:contact_id])
    @calls = @contact.calls
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @call = @contact.calls.find(params[:id])
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @call = @contact.calls.new(call_params)
    respond_with(@call)
  end

  def edit
    @contact = Contact.find(params[:contact_id])
    @call = @contact.calls.find(params[:id])
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @call = @contact.calls.new(call_params)
    @call.save
  end

  def update
    @contact = Contact.find(params[:contact_id])
    @call = @contact.calls.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @call = @contact.calls.find(params[:id])
    @call.destroy
  end

  private
    def call_params
      params.require(:call).permit(:contact_id, :dial, :conversation, :invest, :timing, :motivator)
    end
end
