class ChargesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Call Carousel Subscription",
      currency: 'usd'
    )

    flash[:success] = "Thank you for subscribing to Call Carousel."
    redirect_to contacts_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Call Carousel Subscription",
      amount: 5_00
    }
  end
end
