class TransactionsController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Call Carousel Membership",
      amount: 5_00
    }
  end

  def create

    customer = Stripe::Customer.create(
      # email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 5_00,
      description: "Call Carousel Membership",
      currency: 'usd'
    )

    current_user.update_attributes(role: 'premium')

    flash[:success] = "Thank you for subscribing to Call Carousel."
    redirect_to contacts_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_transactions_path
  end
end
