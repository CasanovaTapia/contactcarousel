class SubscriptionsController < ApplicationController
  skip_before_filter :authenticate_user!

  before_filter :load_plans

  def index
    @plans = Plan.all
  end

  def new
    @subscription = Subscription.new
    @plan = Plan.find(params[:plan_id])
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @subscription = CreateSubscription.call(
      @plan,
      params[:email_address],
      params[:stripeToken]
    )
    if @subscription.errors.blank?
      flash[:notice] = 'Thank you for subscribing to Call Carousel'
      redirect_to '/'
    else
      flash[:notice] = 'Your subscription was not successful. Please try again.'
      render :new
    end
  end

  protected

  def load_plans
    @plans = Plan.where(published: true).order('amount')
  end
end
