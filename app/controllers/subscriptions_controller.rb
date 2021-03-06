class SubscriptionsController < ApplicationController
  def new
		@subscription = Subscription.new
  end

  def create
		Stripe.api_key = "sk_test_784Tfetqy9nGz4iTgMpyCkb9"
		token = params[:subscription][:card_token]

		begin
		  charge = Stripe::Charge.create(
		    :amount => 10000, # Amount in cents
		    :currency => "usd",
		    :source => token,
		    :description => "Example charge"
		  )
		rescue Stripe::CardError => e
		end
	end



	private

  def subscription_params
    params.require(:subscription).permit( :full_name, :telephone, :email, :card_token)
  end
end
