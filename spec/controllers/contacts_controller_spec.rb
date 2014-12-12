require 'rails_helper'

RSpec.describe ContactsController, :type => :controller do
  describe "GET index" do
    it "assigns @contacts" do
      contact = FactoryGirl.create(:contact)
      get :index
      expect(assigns(:contacts)).to eq([contact])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
    end

    it "assigns @contact" do
      get :show, id: @contact
      expect(assigns(:contact)).to eq(@contact)
    end

    it "renders the show template" do
      get :show, id: @contact
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns a new Contact to @contact" do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "saves the new contact in the database" do
        expect{ post :create, contact: FactoryGirl.attributes_for(:contact) }.to change{ Contact.all.size }.by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the contact without a name" do
        expect{ post :create, contact: FactoryGirl.attributes_for(:contact, name: nil) }.to change{ Contact.all.size }.by(0)
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @contact = FactoryGirl.create(:contact)
    end

    it "located the requested @contact" do
      put :update, id: @contact, contact: FactoryGirl.attributes_for(:contact)
      expect(assigns(:contact)).to eq(@contact)
    end

    it "changes @contact attributes" do
      put :update, id: @contact, contact: FactoryGirl.attributes_for(:contact, name: "Updated name")
      @contact.reload
      expect(@contact.name).to eq("Updated name")
    end
  end

  describe "DELETE destroy" do
    it "deletes the contact" do
      @contact = FactoryGirl.create(:contact)

      expect{ delete :destroy, id: @contact }.to change{ Contact.all.size }.by(-1)
    end
  end
end
