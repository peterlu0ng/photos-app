class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_user_paid?

  def show
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    @checkout_session = current_user
                        .payment_processor
                        .checkout(
                          mode: 'payment',
                          line_items: 'price_1PRRjLI4Zyhf3cOmJl2SSnPC',
                          success_url: checkout_success_url
                            )
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @line_items = Stripe::Checkout::Session.list_line_items(params[:session_id])
    current_user.paid = true
    current_user.save!
  end

  private
  def is_user_paid?
    if current_user.paid?
      flash[:alert] = "You have already paid."
      redirect_to root_path
    end
  end
end
