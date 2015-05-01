require 'sinatra'
require 'stripe'
require 'dotenv'

Dotenv.load

Stripe.api_key = ENV['STRIPE_TEST_SECRET_KEY']

get '/' do
  status 200
  return "This is Genie's sample backend that does Stripe Transactions!"
end

post '/user' do
  # Get the credit card details submitted by the form
  token = params[:stripeToken]

  begin
    # Create a Customer
    customer = Stripe::Customer.create(
      :source => token,
      :email => params[:email],
      :metadata => { :name => params[:name] },
    )
  rescue => e
    status 402
    return "Error creating customer"
  end

  status 200
  return customer.id

end

post '/charge' do

  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => params[:amount], # this number should be in cents
      :currency => "zar",
      :customer => params[:customerId]
    )
  rescue Stripe::CardError => e
    status 402
    return "Error creating charge."
  end

  status 200
  return "Order successfully created"

end
