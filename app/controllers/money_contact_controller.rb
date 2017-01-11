class MoneyContactController < ApplicationController


  def setUpAccs

    plaidUser = Plaid::User.exchange_token(
        @plaid_public_token,
        @plaid_acc_id,
        product: :auth
    )
    bank_account_token = plaidUser.stripe_bank_account_token

    stripeUser =Stripe::Customer.create(
        :description => "",
        :source => bank_account_token
    )
    stripeUser_id = stripeUser.id

  end


end
